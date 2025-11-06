# SSH Project

This project contains scripts and configurations for SSH key management and server connections.

## Files

- `0-use_a_private_key`: Bash script that connects to a server using the private key ~/.ssh/school
- `1-create_ssh_key_pair`: Bash script that creates an RSA key pair named "school" with 4096 bits
- `2-ssh_config`: SSH client configuration file that uses the school private key and refuses password authentication
- `school`: Private SSH key (4096-bit RSA, protected with passphrase "betty")
- `school.pub`: Public SSH key to be added to server's authorized_keys

## Usage

1. Run `./1-create_ssh_key_pair` to generate the SSH key pair
2. Add the public key content to your server's ~/.ssh/authorized_keys
3. Use `./0-use_a_private_key` to connect to your server
4. Configure your SSH client using the settings in `2-ssh_config`

