
# Terraform AWS Scalable Web Application

This project demonstrates deploying a scalable web application infrastructure on AWS using Terraform. The infrastructure includes a VPC, public and private subnets, an Auto Scaling Group of EC2 instances behind an Application Load Balancer, and optionally an RDS database. The project is fully modular and supports multiple environments.

---

## Architecture Overview

- **VPC** with public and private subnets  
- **Internet Gateway** and **NAT Gateway** for outbound internet access  
- **EC2 Auto Scaling Group (ASG)** hosting the web application  
- **Application Load Balancer (ALB)** distributing traffic to EC2 instances  
- **IAM Roles and Security Groups** configured for least privilege  
- **Optional RDS database** for persistent storage  
- **Terraform remote state** managed via S3 backend with DynamoDB locking  

---

## Project Structure

inspira
|----> environments/
|----> |----> dev/
|----> |----> |----> main.tfvars
|----> |----> prod/
|----> |----> |----> main.tfvars
|----> modules/
|----> |----> compute/
|----> |----> |----> main.tf
|----> |----> |----> outputs.tf
|----> |----> |----> variables.tf
|----> |----> database/
|----> |----> |----> main.tf
|----> |----> |----> outputs.tf
|----> |----> |----> variables.tf
|----> |----> network/
|----> |----> |----> main.tf
|----> |----> |----> outputs.tf
|----> |----> |----> variables.tf
|----> backend.tf
|----> main.tf
|----> outputs.tf
|----> providers.tf
|----> README.md
|----> variables.tf

---

## Prerequisites

- Terraform v1.5 or later  
- AWS CLI configured with appropriate credentials  
- AWS account with permissions to create VPC, EC2, ELB, RDS, IAM, S3, and DynamoDB resources  

---

## Setup Instructions

1. **Configure backend**: Make sure your S3 bucket and DynamoDB table for state locking are created and update `backend.tf` accordingly.

2. **Initialize Terraform:**

   ```bash
   terraform init
````

3. **Select environment and apply:**

   For dev environment:

   ```bash
   terraform apply -var-file=environments/dev/main.tfvars
   ```

   For prod environment:

   ```bash
   terraform apply -var-file=environments/prod/main.tfvars
   ```

4. **Access your web application:**

   After apply completes, Terraform outputs the ALB DNS name. Visit this URL in your browser.

---

## Customization

* Modify instance types, AMI IDs, or subnet CIDRs in the environment `.tfvars` files.
* Enable or disable the RDS database by toggling the `create_db` variable.
* Update the `user_data/user_data.sh` script to deploy your web app code.

---

## Modules Overview

* **Network:** Creates the VPC, subnets, routing, and gateways.
* **Compute:** Deploys EC2 Auto Scaling Group and Application Load Balancer.
* **Database:** Optionally provisions an RDS instance with subnet group and security groups.

---

## Tips

* Use remote state locking to prevent concurrent modifications.
* Use multiple environment folders to separate dev and prod configurations.
* Modularize your code to increase reusability and maintainability.

---

## References

* [Terraform AWS Provider](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
* [AWS VPC](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
* [Terraform Modules](https://www.terraform.io/language/modules)

---

## Author

* Your Name
* [GitHub Profile](https://github.com/kavinda85346)

---

## License

This project is licensed under the MIT License.

