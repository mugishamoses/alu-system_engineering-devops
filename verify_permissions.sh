#!/usr/bin/env bash
# Verification script to check Git file permissions

echo "=== Git File Permissions Check ==="
echo ""
echo "Checking SSH scripts in Git index:"
git ls-files --stage ssh/*.sh ssh/*-* | grep -v "\.pub\|school$\|README"
echo ""
echo "Expected: All scripts should show 100755 (executable)"
echo ""
echo "=== Testing 1-create_ssh_key_pair ==="
echo "File content:"
cat ssh/1-create_ssh_key_pair
echo ""
echo "=== Verification Complete ==="
