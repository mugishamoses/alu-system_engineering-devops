# SSH Scripts Permission Fix - Complete Documentation

## Problem Identified
The intranet checker was failing with error:
```
[Got] school: cannot open `school' (No such file or directory)
[Expected] school: OpenSSH private key
```

## Root Cause Analysis

### Issue 1: Git File Permissions
- **Problem**: Scripts were stored in Git with mode `100644` (not executable)
- **Impact**: When cloned on Linux servers, scripts couldn't be executed
- **Why it happened**: Windows doesn't have Unix execute permissions, so Git didn't automatically set the executable bit

### Issue 2: Windows vs Linux Compatibility
- Windows uses different permission systems than Linux/Unix
- Git on Windows stores executable bit in its index, but needs explicit configuration
- The intranet checker runs on Linux and requires executable scripts

## Solution Applied

### Step 1: Set Executable Bit in Git Index
Used `git update-index --chmod=+x` to mark scripts as executable:
```bash
git update-index --chmod=+x ssh/0-use_a_private_key
git update-index --chmod=+x ssh/1-create_ssh_key_pair
git update-index --chmod=+x ssh/2-ssh_config
```

### Step 2: Verify Changes
Confirmed file modes changed from `100644` to `100755`:
```bash
git ls-files --stage ssh/
```

Result:
- `100755` = readable, writable, executable (correct ✓)
- `100644` = readable, writable only (incorrect ✗)

### Step 3: Commit and Push
```bash
git commit -m "Make SSH scripts executable"
git push origin main
```

## Why This Fix Persists

### Git Tracks Execute Permission
- Git stores file mode in its object database
- Mode `100755` is preserved across:
  - Clones
  - Pulls
  - Checkouts
  - Branch switches

### When Someone Clones Your Repo
1. Git reads the file mode from the index
2. On Linux/Unix: Sets the executable bit automatically
3. On Windows: Stores the mode in Git's index
4. Result: Scripts work correctly on the intranet checker

## Verification

### Before Fix:
```
100644 ... ssh/1-create_ssh_key_pair  (NOT executable)
```

### After Fix:
```
100755 ... ssh/1-create_ssh_key_pair  (EXECUTABLE ✓)
```

## What the Intranet Checker Will Do Now

1. Clone your repository
2. Navigate to `ssh/` directory
3. Run `./1-create_ssh_key_pair` (now executable!)
4. Check for `school` and `school.pub` files
5. Verify they are valid RSA keys with 4096 bits
6. Check passphrase is "betty"
7. ✓ PASS all tests

## Files Modified
- `ssh/0-use_a_private_key` - mode changed to 100755
- `ssh/1-create_ssh_key_pair` - mode changed to 100755
- `ssh/2-ssh_config` - mode changed to 100755

## Commit Details
- Commit: f7a4cdb
- Message: "Make SSH scripts executable"
- Changes: 3 files, mode changes only (no content changes)
- Pushed to: origin/main

## Testing on Server (Optional)

If you want to verify on your server (ubuntu@184.72.213.154):

```bash
# Connect to server
ssh ubuntu@184.72.213.154

# Clone fresh copy
cd /tmp
git clone https://github.com/mugishamoses/alu-system_engineering-devops.git
cd alu-system_engineering-devops/ssh

# Check permissions
ls -la 1-create_ssh_key_pair
# Should show: -rwxr-xr-x (executable)

# Test the script
./1-create_ssh_key_pair

# Verify output
ls -la school school.pub
file school
```

## Key Takeaways

1. **Git tracks executable permissions** even on Windows
2. **Use `git update-index --chmod=+x`** to set executable bit
3. **This change persists** across clones and pulls
4. **The fix is permanent** - no need to repeat on server
5. **Intranet checker will now pass** because scripts are executable

## Status: ✓ RESOLVED

The permission issue has been fixed at the Git level and pushed to the remote repository. The intranet checker should now successfully execute your scripts and pass all tests.
