# ALU System Engineering & DevOps

This repository contains system engineering and DevOps projects covering essential infrastructure and server management topics.

## Project Structure

### 🔥 Firewall
- **Purpose**: Network security configuration using UFW (Uncomplicated Firewall)
- **Key Files**: 
  - `configure_ufw.sh` - Automated UFW setup script
  - `0-block_all_incoming_traffic_but` - Traffic blocking configuration

### 🔐 SSH
- **Purpose**: Secure Shell configuration and key management
- **Key Files**:
  - `0-use_a_private_key` - Private key authentication setup
  - `1-create_ssh_key_pair` - SSH key generation script
  - `2-ssh_config` - SSH client configuration

### 🌐 Web Server
- **Purpose**: Nginx web server setup and configuration
- **Key Files**:
  - `1-install_nginx_web_server` - Nginx installation script
  - `2-setup_a_domain_name` - Domain configuration
  - `3-redirection` - URL redirection setup
  - `4-not_found_page_404` - Custom 404 error handling
  - `5-design_a_beautiful_404_page.html` - Custom 404 page design

### ⚖️ Load Balancer
- **Purpose**: Load balancing configuration for high availability
- **Key Files**:
  - `0-custom_http_response_header` - Custom HTTP headers
  - `1-install_load_balancer` - Load balancer setup

### 🐛 Web Stack Debugging
Multiple debugging scenarios for web stack troubleshooting:
- **debugging_0**: Basic web server issues
- **debugging_1**: Nginx port configuration
- **debugging_2**: User permissions and Nginx
- **debugging_3**: Puppet configuration debugging
- **debugging_4**: Performance optimization

## Technologies Used
- **Operating System**: Ubuntu/Linux
- **Web Server**: Nginx
- **Firewall**: UFW (Uncomplicated Firewall)
- **Configuration Management**: Puppet
- **Scripting**: Bash
- **Security**: SSH, SSL/TLS

## Getting Started

1. Clone this repository
2. Make scripts executable: `chmod +x script_name`
3. Run scripts with appropriate permissions (some require sudo)

## Security Features
- UFW firewall configuration
- SSH key-based authentication
- HTTPS/SSL setup
- Secure server configurations

## Author
**Mugisha Moses**
- GitHub: [@mugishamoses](https://github.com/mugishamoses)