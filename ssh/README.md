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
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDH9ebHUxRwPkKs2PhQfETNYUfBa7006SLoazfGCp5PaD44Yoon0PZ+3FV0MPPqAu9ua32MxNT68ME/xe24a6PoFz3GiLm+rOZBeQMpIvZ1K1AmB4YQQp4nFz0DB2H9Alx1dxQyn97O87iuQ5tsUerEx68ceBCTiDMr1RCnHT0JKqlBXunsklXaWb1bNx/YLp2e4z3IlNm90F3waiRgyt5fc1jT/MwtjRMVoJa0/G8cxwe8rZyd+8VPonPTy/Frd9YWiZdO/H0hsxDDhtHOFVZrehvFB3gBkCvML6k+ilST7drE1i3Vv4DM2Z7JUZGphBM8qJEYzWFIGKqcIjX+/KF3Bdsafxbb+bH7UEQYHOoTGDtybHTqdl1ZJZberWtLzbXiXcMNs//eatIAbykiKBq2LmEGbMxV4/wq/zotFCIcLzvDvOLNzCgSChK03BbufojIypqVGLLYId8CSG53O9p3tQ6bxJPWvoLAsRvAYandIfCh4RVaSl+cD3wgI3MWlXvv9RdoTTNsPOqvagTk50uPpLVDwkpKzvfeuurf831T/5wKW5y7bSdB022kG5Ek6KLfzvOdK0WibXtDFywhYfICjvppYFJJcuBZI0Atihasba3q8Jc19s0RDoBDtMByikAe3IAWLJvHSpVVkWV4HpQ4PIkywxxap3bOy8fSzMSrMQ==
```