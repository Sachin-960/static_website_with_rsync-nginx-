```markdown
# 🚀 Static Website Deployment with WSL + rsync + AWS EC2

This project provides a streamlined workflow to **deploy a static website** from your **Windows machine** (via WSL) directly to an **AWS EC2 Ubuntu server** running **Nginx**.

## 📂 Project Structure

```
Static Site Server/
├── index.html
├── about.html
├── contact.html
├── style.css
├── images/
│   └── ...
├── deploy.sh
└── README.md
```

## 📜 Prerequisites

- ✅ WSL installed (e.g., Ubuntu)
- ✅ `rsync` installed in WSL (`sudo apt install rsync`)
- ✅ AWS EC2 instance (Ubuntu) with:
  - Open port **80**
  - Nginx installed (`sudo apt install nginx`)
  - Nginx serving content from `/var/www/html`
- ✅ SSH key pair (`sshtest2`, `sshtest2.pub`)
- ✅ Your EC2 server's public IP address

## 🔐 Setup SSH Access

1. Copy your public key (`sshtest2.pub`) to the EC2 instance:

```bash
ssh-copy-id -i ~/.ssh/sshtest2.pub ubuntu@<your-ec2-ip>
```

2. Or manually add the public key to `/home/ubuntu/.ssh/authorized_keys`.

## 🚀 Deploy Script

### `deploy.sh`

This script:

1. Copies your static site and SSH key into WSL (if run from Windows path).
2. Uses `rsync` to transfer your site files to `/var/www/html` on EC2.
3. Provides detailed logging and error handling.

### Usage

```bash
bash deploy.sh
```

## 🛠 Fixing Common Errors

- **Permission denied (publickey)**:  
  Ensure private key has correct permissions:  
  ```bash
  chmod 400 ~/.ssh/sshtest2
  ```

- **Cannot write to `/var/www/html`**:  
  On EC2, run:  
  ```bash
  sudo chown -R ubuntu:ubuntu /var/www/html
  ```

- **rsync error about directories**:  
  Make sure `/var/www/html` exists on EC2 and the user has permission.

## ✅ Example Output

```bash
🔐 Copying SSH key to WSL...
📁 Copying static site from Windows to WSL...
🚀 Deploying static site to ubuntu@3.80.72.35...
✔️ Deployment successful!
```

## 👨‍💻 Author

**Sachin Dayal**  

---

This project is a part of [roadmap.sh](https://roadmap.sh/projects/static-site-server) Devops Projects
