#!/usr/bin/env bash
# Script to set up the server with the required public keys

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Add ALU's public key to authorized_keys (for task 3)
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN" >> ~/.ssh/authorized_keys

# Add your generated public key to authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzXH5GdX2ZDpFciPV1Fm7PHVVFuhdv4qcxutbm7VyMpbpy0l71VYVGCVHc47cDnlQT9NGr0kE/LhBAWwUzVH7fi9F8coq84+jWNDxB7pV+aZi3ucRMFvq3aEufgCtKnT+P4yXb7WlEyMRPYuoMSuVjDGhKMwFcMW9gM95AcExfGof+ZvSCFq8xZz0c+mXPyrFhW0YKT+12sRcu3XYaxmJOQycWK30H++JiUF3w0MtoujJo5rjbY7UBcyRIQ5PY8LKtj01StkvR3BhBP0kAb9MMm155g6su2iqWR2/52+ClXix0xy9P51oFFXu+dAbkmePPVlvtudQpoBqbdf2Sh2S8a6Cvg5oGfCl43KZFaCbiezY4nQ0D2vdUhv0FB5ll0wftI5rr8nI/gTO16hcsckYzbmI7YJtJHE+CCa5N8QTX2iykK6VCsdMJRNI7Y4aohM9f62eqk4rfR2+OVqU4oGLQFyE8RvWYAJlFwtQWTt3pXDxCjNTSSkL+RCrr+gRX8l1xTlVxnb5Wvvfr4wi/F8aQoqp7xRsQbF2r/WWC7z/0vxUkIcqSTQEnmM99NMFW8NBFxTTNQg9RqMop6WsqzKw42LGa535e+uyK6F+SIXP8YrnjdslMxYEo37DT5loTGnpZfxSxnyGNqRgRajgvsYGk19AdlIOXc1M3B8xGo4C5TQ==" >> ~/.ssh/authorized_keys

# Set correct permissions
chmod 600 ~/.ssh/authorized_keys

echo "Server setup complete! Both ALU's key and your generated key have been added."
echo "You can now connect using: ssh -i ~/.ssh/school ubuntu@YOUR_SERVER_IP"