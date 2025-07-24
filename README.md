# 🌐 3-Tier Scalable Web Application on AWS (Terraform + Docker)

This project provisions a **production-grade 3-tier web application architecture** on AWS using **Terraform** and **Docker Compose**. The setup includes **load balancing**, **auto scaling**, **monitoring**, **WAF protection**, and a **managed RDS MySQL database**. Everything is fully automated via Terraform modules.

---
## 🖼️ Architecture Diagram

![Architecture](images/architecture.png)

## 📸 WordPress App Running on ALB

![WordPress UI](images/wordpress-ui.png)


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
