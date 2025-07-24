# 🌐 3-Tier Scalable Web Application on AWS (Terraform + Docker)

This project provisions a **production-grade 3-tier web application architecture** on AWS using **Terraform** and **Docker Compose**. The setup includes **load balancing**, **auto scaling**, **monitoring**, **WAF protection**, and a **managed RDS MySQL database**. Everything is fully automated via Terraform modules.

---
## 🖼️ Architecture Diagram
<img width="491" height="537" alt="diagrame" src="https://github.com/user-attachments/assets/2418fc19-8790-472b-8045-782e57c48b0d" />

## 📸 WordPress App Running on ALB
<img width="1461" height="961" alt="test" src="https://github.com/user-attachments/assets/d9268230-4abf-486b-8622-f81531fc9019" />
<img width="1698" height="900" alt="test2" src="https://github.com/user-attachments/assets/353e563c-cdf1-4fd6-9476-15c011fa63a8" />
<img width="1662" height="903" alt="test3" src="https://github.com/user-attachments/assets/757dbafa-00a9-4770-96d1-ca33f8f26073" />
<img width="1728" height="650" alt="test4" src="https://github.com/user-attachments/assets/6b3684f9-f58e-470a-b367-05b7e3db920e" />
<img width="1749" height="700" alt="test5" src="https://github.com/user-attachments/assets/ff8af28c-a43a-4942-9b48-eabdbc70b99b" />

## 🧱 Architecture Overview

```
               Internet
                   │
             ┌────────────┐
             │   AWS WAF  │
             └─────┬──────┘
                   ▼
          ┌─────────────────┐
          │     ALB (ELB)   │
          └─────────────────┘
                   │
         ┌─────────┴─────────┐
         ▼                   ▼
 ┌────────────┐       ┌────────────┐
 │ EC2 (App 1)│       │ EC2 (App 2)│   ← Docker Compose containers
 └────────────┘       └────────────┘
         │                   │
         └─────► Auto Scaling◄──────┘
                   │
                   ▼
          ┌────────────────┐
          │  Amazon RDS    │  ← MySQL
          └────────────────┘
```

---

## ⚙️ Technologies Used

- **Terraform** (modular, production-style)
- **Amazon VPC** with 2 public + 2 private subnets (multi-AZ)
- **EC2** instances (Dockerized app)
- **Docker Compose** (multi-container deployment)
- **Application Load Balancer (ALB)**
- **Auto Scaling Group (ASG)**
- **Amazon RDS (MySQL)**
- **AWS WAF (Web Application Firewall)**
- **AWS CloudWatch** (logs, metrics, alarms)
- **Bastion Host** (SSH access to private subnet)
- **User Data** scripts to install & run app automatically

---

## 📁 Terraform Project Structure

```
.
├── modules/
│   ├── vpc/
│   ├── ec2/
│   ├── rds/
│   ├── alb/
│   ├── waf/
│   ├── asg/
│   ├── cloudwatch/
│   └── bastion/
├── main.tf
├── user_data/
│   ├── install_wordpress.tpl
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```

---

## 🚀 Features

- 🔁 **Auto Scaling**: EC2 instances scale automatically based on CloudWatch alarms
- 📦 **Dockerized App**: Runs with `docker-compose` from user data
- 🔐 **Private RDS**: Accessible only from private subnets
- 🛡️ **WAF Protection**: Blocks common threats before reaching ALB
- 📊 **CloudWatch Integration**: Logging, metrics, and alarms
- 🧳 **SSH via Bastion Host**: Secure access to internal resources
- ☁️ **Infrastructure as Code**: 100% reproducible with Terraform

---

## 🧪 How to Deploy

> Requirements:  
> - Terraform v1.5+  
> - AWS CLI configured  
> - Existing AWS Key Pair  

```bash
# Initialize Terraform
terraform init

# Review infrastructure plan
terraform plan

# Apply changes
terraform apply
```

---

## 🔐 Access

- **Application URL**: `http://<alb-dns-name>`
- **RDS Endpoint**: `<rds-endpoint>`
- **SSH Access via Bastion**:
  ```bash
  ssh -i <your-key.pem> ec2-user@<bastion-ip>
  ```

---

## 🛠 Future Improvements

- [ ] Add HTTPS with ACM + ALB listener
- [ ] Use Route53 for domain name
- [ ] Add CI/CD using GitHub Actions or CodePipeline
- [ ] Add S3 backup for RDS & logs

---

## 👨‍💻 Author

**Shady Emad**  
DevOps | Linux | AWS | Docker | Kubernetes  
[LinkedIn](https://www.linkedin.com/in/shady-emad)

---
