#!/usr/bin/env bash
# Script to add intranet's public key to your server
# Run this script ON YOUR SERVER (ubuntu@184.72.213.154)

echo "=== Adding Intranet Public Key to authorized_keys ==="
echo ""

# The intranet's public key
INTRANET_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN"

# Create .ssh directory if it doesn't exist
echo "Step 1: Creating .ssh directory..."
mkdir -p ~/.ssh
chmod 700 ~/.ssh
echo "✓ .ssh directory ready (permissions: 700)"
echo ""

# Check if key already exists
if grep -q "AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId" ~/.ssh/authorized_keys 2>/dev/null; then
    echo "⚠ Key already exists in authorized_keys"
    echo ""
else
    # Add the key
    echo "Step 2: Adding intranet's public key..."
    echo "$INTRANET_KEY" >> ~/.ssh/authorized_keys
    echo "✓ Key added to authorized_keys"
    echo ""
fi

# Set correct permissions
echo "Step 3: Setting correct permissions..."
chmod 600 ~/.ssh/authorized_keys
echo "✓ authorized_keys permissions set to 600"
echo ""

# Verify
echo "Step 4: Verification"
echo "-------------------"
echo "Directory permissions:"
ls -ld ~/.ssh/
echo ""
echo "File permissions:"
ls -l ~/.ssh/authorized_keys
echo ""
echo "Number of keys in authorized_keys:"
grep -c "^ssh-" ~/.ssh/authorized_keys
echo ""
echo "Intranet key present:"
if grep -q "AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId" ~/.ssh/authorized_keys; then
    echo "✓ YES - Intranet can connect"
else
    echo "✗ NO - Key not found"
fi
echo ""
echo "=== Setup Complete ==="
echo "The intranet checker should now be able to connect to your server."
