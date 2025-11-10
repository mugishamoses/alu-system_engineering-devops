# Task 3: "Let me in!" - Complete Implementation Guide

## Understanding the Task

### What It Is
This task requires you to add the intranet's SSH public key to your server's `authorized_keys` file so the automated checker can SSH into your server to verify your work.

### What It's NOT
- This is NOT a file you commit to Git
- This is NOT a script you write
- This is a **server configuration task**

### Why It's Needed
The intranet needs to:
1. Connect to your server to check your configurations
2. Verify other SSH-related tasks
3. Test that your server is properly configured

## The Error You're Seeing

**Error**: "You added our public key to your web01 server- Execution n"

This incomplete error suggests:
- The checker is trying to connect to your server
- The connection is failing or timing out
- The key might not be properly added or permissions are wrong

## Complete Solution

### Method 1: Manual Commands (Recommended)

**Step 1**: Connect to your server
```bash
ssh ubuntu@184.72.213.154
```

**Step 2**: Run these commands on the server
```bash
# Create .ssh directory with correct permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Add the intranet's public key (SINGLE COMMAND - copy all of it)
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN" >> ~/.ssh/authorized_keys

# Set correct permissions on authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Verify it was added
cat ~/.ssh/authorized_keys
```

**Step 3**: Verify permissions
```bash
ls -la ~/.ssh/
```

Expected output:
```
drwx------ 2 ubuntu ubuntu 4096 ... .ssh
-rw------- 1 ubuntu ubuntu  XXX ... authorized_keys
```

### Method 2: Using the Automated Script

**Step 1**: Transfer the script to your server
```bash
# From your local machine
scp add_intranet_key.sh ubuntu@184.72.213.154:~/
```

**Step 2**: Connect and run the script
```bash
ssh ubuntu@184.72.213.154
chmod +x add_intranet_key.sh
./add_intranet_key.sh
```

## Critical Requirements

### 1. Permissions MUST Be Correct
```
~/.ssh/                  → 700 (drwx------)
~/.ssh/authorized_keys   → 600 (-rw-------)
```

**Why?** SSH refuses to use keys if permissions are too open (security feature)

### 2. Key MUST Be on Single Line
The public key is one long line - no line breaks or spaces in the middle.

### 3. Key MUST Be for User 'ubuntu'
The key must be in `/home/ubuntu/.ssh/authorized_keys` (not root or another user)

## Verification Checklist

Run these commands on your server to verify everything is correct:

```bash
# 1. Check .ssh directory exists and has correct permissions
ls -ld ~/.ssh/
# Expected: drwx------ 2 ubuntu ubuntu 4096 ... .ssh

# 2. Check authorized_keys exists and has correct permissions
ls -l ~/.ssh/authorized_keys
# Expected: -rw------- 1 ubuntu ubuntu ... authorized_keys

# 3. Check the intranet key is present
grep "AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId" ~/.ssh/authorized_keys
# Expected: Should show the full key

# 4. Count total keys
grep -c "^ssh-" ~/.ssh/authorized_keys
# Expected: At least 1 (could be more if you have other keys)

# 5. Check SSH service is running
sudo systemctl status ssh
# Expected: active (running)

# 6. Check SSH is listening on port 22
sudo ss -tlnp | grep :22
# Expected: Should show sshd listening on port 22
```

## Common Issues and Fixes

### Issue 1: Permission Denied
**Symptom**: Checker can't connect
**Fix**:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

### Issue 2: Key Not Found
**Symptom**: Key doesn't appear in authorized_keys
**Fix**: Re-add the key, ensure you copy the ENTIRE key including "ssh-rsa" at the start

### Issue 3: Line Breaks in Key
**Symptom**: Key appears on multiple lines
**Fix**: Remove the key and re-add it as a single line

### Issue 4: Wrong User
**Symptom**: Key added to wrong user's authorized_keys
**Fix**: Ensure you're logged in as 'ubuntu' user when adding the key

### Issue 5: SSH Service Not Running
**Symptom**: Can't connect at all
**Fix**:
```bash
sudo systemctl start ssh
sudo systemctl enable ssh
```

## What Happens After You Add the Key

1. **Intranet checker initiates connection**:
   ```
   ssh -i /path/to/intranet/private/key ubuntu@184.72.213.154
   ```

2. **Your server checks authorized_keys**:
   - Looks in `/home/ubuntu/.ssh/authorized_keys`
   - Finds the matching public key
   - Allows connection

3. **Checker verifies**:
   - Connection successful
   - Can execute commands
   - ✓ Task passes

## Testing the Connection (Optional)

You can't test with the intranet's private key (you don't have it), but you can verify SSH is working:

```bash
# Check SSH logs for connection attempts
sudo tail -f /var/log/auth.log

# Look for lines like:
# "Accepted publickey for ubuntu from [IP]"
```

## Final Steps

1. ✓ Add the key to your server (using Method 1 or 2)
2. ✓ Verify permissions are correct
3. ✓ Verify key is present in authorized_keys
4. ✓ Go to intranet and request a new review
5. ✓ Wait for checker to connect and verify

## Important Notes

- **No Git commit needed** - This is server configuration only
- **The key stays on the server** - Don't delete it
- **Multiple keys are OK** - You can have your own keys + intranet's key
- **This is permanent** - Once added, the intranet can always connect (until you remove the key)

## Status: Ready to Implement

You now have everything you need to complete this task. Follow Method 1 (manual commands) for the most reliable approach.
