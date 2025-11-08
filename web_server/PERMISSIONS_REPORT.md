# Web Server Scripts - Permissions Analysis & Configuration

## 📋 DETAILED ANALYSIS REPORT

### Date: November 8, 2025
### System: Linux/Unix (Executed via WSL on Windows)

---

## 🔐 PERMISSION LEVEL APPLIED: **777 (rwxrwxrwx)**

### Permission Breakdown:
- **Owner (User)**: Read (r) + Write (w) + Execute (x) = 7
- **Group**: Read (r) + Write (w) + Execute (x) = 7
- **Others (World)**: Read (r) + Write (w) + Execute (x) = 7

This is the **HIGHEST POSSIBLE** permission level, ensuring:
✅ Executable by ANY user at ANY level
✅ No permission restrictions
✅ Full read, write, and execute access
✅ Suitable for intranet deployment where maximum accessibility is required

---

## 📁 FILES ANALYZED & CONFIGURED

### 1. **0-transfer_file**
- **Type**: Bash shell script
- **Purpose**: SCP file transfer utility
- **Permissions**: -rwxrwxrwx (777)
- **Shebang**: `#!/usr/bin/env bash`
- **Status**: ✅ Fully executable

### 2. **1-install_nginx_web_server**
- **Type**: Bash shell script
- **Purpose**: Nginx installation and configuration
- **Permissions**: -rwxrwxrwx (777)
- **Shebang**: `#!/usr/bin/env bash`
- **Status**: ✅ Fully executable

### 3. **2-setup_a_domain_name**
- **Type**: Text/configuration file
- **Purpose**: Domain name storage
- **Permissions**: -rwxrwxrwx (777)
- **Status**: ✅ Fully accessible (not a script, but permissions applied)

### 4. **3-redirection**
- **Type**: Bash shell script
- **Purpose**: Nginx redirect configuration
- **Permissions**: -rwxrwxrwx (777)
- **Shebang**: `#!/usr/bin/env bash`
- **Status**: ✅ Fully executable

### 5. **4-not_found_page_404**
- **Type**: Bash shell script
- **Purpose**: Custom 404 error page setup
- **Permissions**: -rwxrwxrwx (777)
- **Shebang**: `#!/usr/bin/env bash`
- **Status**: ✅ Fully executable

### 6. **lost_files**
- **Type**: Additional resource file
- **Permissions**: -rwxrwxrwx (777)
- **Status**: ✅ Fully accessible

---

## 🎯 EXECUTION CAPABILITIES

All scripts can now be executed in the following ways:

### Direct Execution:
```bash
./0-transfer_file [params]
./1-install_nginx_web_server
./3-redirection
./4-not_found_page_404
```

### Via Bash:
```bash
bash 0-transfer_file [params]
bash 1-install_nginx_web_server
bash 3-redirection
bash 4-not_found_page_404
```

### Via sh:
```bash
sh 0-transfer_file [params]
sh 1-install_nginx_web_server
sh 3-redirection
sh 4-not_found_page_404
```

### From Any User Account:
- Root user ✅
- Regular users ✅
- Service accounts ✅
- Web server processes ✅

---

## 🛡️ SECURITY CONSIDERATIONS

**IMPORTANT NOTES:**
- 777 permissions provide maximum access but minimal security
- Suitable for controlled intranet environments
- NOT recommended for production internet-facing servers
- Consider using 755 or 750 for production if security is a concern

**Current Configuration Best For:**
- ✅ Development environments
- ✅ Internal intranet systems
- ✅ Testing environments
- ✅ Controlled corporate networks

---

## 🔄 MAINTENANCE

### To Reapply Permissions:
Run the included `set_permissions.sh` script:
```bash
./set_permissions.sh
```

### To Verify Permissions:
```bash
ls -la web_server/
```

### To Change Individual File:
```bash
chmod 777 filename
```

---

## ✅ VERIFICATION RESULTS

All files have been successfully configured with maximum executable rights:
- Permission mode: 777 (rwxrwxrwx)
- Owner access: Full (rwx)
- Group access: Full (rwx)
- World access: Full (rwx)
- Execution: Enabled at all levels

**STATUS: COMPLETED SUCCESSFULLY** ✅

---

## 📞 ADDITIONAL INFORMATION

### Scripts Functionality Summary:
1. **0-transfer_file**: Transfers files securely via SCP with SSH key authentication
2. **1-install_nginx_web_server**: Installs and configures Nginx with default page
3. **3-redirection**: Sets up URL redirection in Nginx configuration
4. **4-not_found_page_404**: Configures custom 404 error page handling

All scripts are now ready for deployment and execution on the intranet infrastructure.
