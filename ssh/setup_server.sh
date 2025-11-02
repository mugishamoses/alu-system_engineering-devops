#!/usr/bin/env bash
# Script to set up the server with the required public keys

# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Add ALU's public key to authorized_keys (for task 3)
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDNdtrNGtTXe5Tp1EJQop8mOSAuRGLjJ6DW4PqX4wId/Kawz35ESampIqHSOTJmbQ8UlxdJuk0gAXKk3Ncle4safGYqM/VeDK3LN5iAJxf4kcaxNtS3eVxWBE5iF3FbIjOqwxw5Lf5sRa5yXxA8HfWidhbIG5TqKL922hPgsCGABIrXRlfZYeC0FEuPWdr6smOElSVvIXthRWp9cr685KdCI+COxlj1RdVsvIo+zunmLACF9PYdjB2s96Fn0ocD3c5SGLvDOFCyvDojSAOyE70ebIElnskKsDTGwfT4P6jh9OBzTyQEIS2jOaE5RQq4IB4DsMhvbjDSQrP0MdCLgwkN" >> ~/.ssh/authorized_keys

# Add your generated public key to authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC9r6LswNd0rpUowYK8CGesTDN2ImN2T+Pm7y62GpGFiWT9Fr6q/cT96uAUrJ4SrOYi9wdTtVX/MAQRlUoc75qfIT8qihQcq/lXmQgrSGOlG+5Tlv/bAtfhUxMEVUf0dZq6mDjAj+pW7B4PucOAmFCIwpzdNDVOiEbvdWpowk8N1kRl5jJBP+R8/Fz7dQP6yl2ZYo2Jkm6rGZj8b40Yij+AaU93D+QqHRpt6bKxcGldGG7ejIRJgm1bHafijqpAvvwq8bBf7+S2MLebEotjHUorcYfi9SS/fcheGgAuiIM1DML/CBgHCUZcaiKm5yk71h9qj+AzjxPVWByEpt/cUp6yPi85jXqPU3C8XjS2uC1aexhzEJX8yCdBLkrXtTCYBMaL+urrdv9Cs4znWOxKzfmDDnsJ/zSYt4aT8CHig6bublEBvyi9lqfNUmUd1SeG4zm2UlgEMyoWPGKRXabMMtVVKXIdmAOu18U+O65WeFm+KfEKrKb4X994eCXC3vLLxMfPLtjTRJW5m530S8rYpV9Q+iVHY75ZnNWeZHSvcDNRY93zXTGMqESZlW7fWrkbr4Jz82LuZiJrrC2SBeJLkUF3PdHe807ojLVZLog0dF30nsPxm0DmPCE1ZayJEuwtlZZidz+0uOjoGk4jsnzX3RCKSSCIPvxgymcFNsnolUhkLw==" >> ~/.ssh/authorized_keys

# Set correct permissions
chmod 600 ~/.ssh/authorized_keys

echo "Server setup complete! Both ALU's key and your generated key have been added."
echo "You can now connect using: ssh -i ~/.ssh/school ubuntu@YOUR_SERVER_IP"