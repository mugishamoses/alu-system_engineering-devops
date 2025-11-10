# Task 3: Let me in! - Complete Instructions

## Objective
Add the intranet's public SSH key to your server so they can connect and verify your work.

## The Public Key to Add
```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN
```

## Steps to Complete

### Step 1: Connect to Your Server
```bash
ssh ubuntu@184.72.213.154
```

### Step 2: Add the Public Key
Once connected, run these commands:

```bash
# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh

# Set correct permissions on .ssh directory
chmod 700 ~/.ssh

# Add the intranet's public key to authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN" >> ~/.ssh/authorized_keys

# Set correct permissions on authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Verify the key was added
cat ~/.ssh/authorized_keys
```

### Step 3: Verify Permissions
Ensure the permissions are correct:
```bash
ls -la ~/.ssh/
```

Expected output:
```
drwx------ 2 ubuntu ubuntu 4096 ... .ssh/
-rw------- 1 ubuntu ubuntu  XXX ... authorized_keys
```

### Step 4: Test (Optional)
The intranet checker will test the connection. You can verify SSH is working:
```bash
# Check SSH service status
sudo systemctl status ssh

# Check SSH is listening on port 22
sudo netstat -tlnp | grep :22
```

## Important Notes

1. **This is a server-side task** - No file needs to be committed to Git
2. **The checker will SSH into your server** to verify the key was added
3. **Permissions are critical**:
   - `~/.ssh/` must be `700` (drwx------)
   - `~/.ssh/authorized_keys` must be `600` (-rw-------)
4. **The key must be on a single line** - no line breaks

## Troubleshooting

### If the checker still fails:

1. **Check the key is there**:
   ```bash
   grep "AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId" ~/.ssh/authorized_keys
   ```

2. **Check permissions**:
   ```bash
   ls -la ~/.ssh/authorized_keys
   # Should show: -rw------- 1 ubuntu ubuntu
   ```

3. **Check SSH config allows key authentication**:
   ```bash
   sudo grep "PubkeyAuthentication" /etc/ssh/sshd_config
   # Should show: PubkeyAuthentication yes
   ```

4. **Restart SSH service** (if needed):
   ```bash
   sudo systemctl restart ssh
   ```

5. **Check SSH logs** for connection attempts:
   ```bash
   sudo tail -f /var/log/auth.log
   ```

## What the Intranet Checker Does

1. Attempts to SSH into your server: `ssh ubuntu@184.72.213.154`
2. Uses their private key (matching the public key you added)
3. Verifies successful connection
4. If successful: ✓ Task passes
5. If fails: Shows error message

## Status After Completion

Once you've added the key and verified permissions, request a new review on the intranet. The checker should successfully connect and pass the task.
