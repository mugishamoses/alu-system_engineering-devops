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

## Public Key for Intranet Profile

Add this public key to your intranet profile:

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzXH5GdX2ZDpFciPV1Fm7PHVVFuhdv4qcxutbm7VyMpbpy0l71VYVGCVHc47cDnlQT9NGr0kE/LhBAWwUzVH7fi9F8coq84+jWNDxB7pV+aZi3ucRMFvq3aEufgCtKnT+P4yXb7WlEyMRPYuoMSuVjDGhKMwFcMW9gM95AcExfGof+ZvSCFq8xZz0c+mXPyrFhW0YKT+12sRcu3XYaxmJOQycWK30H++JiUF3w0MtoujJo5rjbY7UBcyRIQ5PY8LKtj01StkvR3BhBP0kAb9MMm155g6su2iqWR2/52+ClXix0xy9P51oFFXu+dAbkmePPVlvtudQpoBqbdf2Sh2S8a6Cvg5oGfCl43KZFaCbiezY4nQ0D2vdUhv0FB5ll0wftI5rr8nI/gTO16hcsckYzbmI7YJtJHE+CCa5N8QTX2iykK6VCsdMJRNI7Y4aohM9f62eqk4rfR2+OVqU4oGLQFyE8RvWYAJlFwtQWTt3pXDxCjNTSSkL+RCrr+gRX8l1xTlVxnb5Wvvfr4wi/F8aQoqp7xRsQbF2r/WWC7z/0vxUkIcqSTQEnmM99NMFW8NBFxTTNQg9RqMop6WsqzKw42LGa535e+uyK6F+SIXP8YrnjdslMxYEo37DT5loTGnpZfxSxnyGNqRgRajgvsYGk19AdlIOXc1M3B8xGo4C5TQ==
```