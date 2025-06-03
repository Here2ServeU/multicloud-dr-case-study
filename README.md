# Case Study: Multi-Cloud Disaster Recovery with Terraform, Serverless, and CI/CD

## Executive Summary

In this case study, we present how a healthcare SaaS provider overcame a major outage by implementing a unified **disaster recovery (DR)** strategy across **AWS, Azure, and Google Cloud**.

The solution leveraged:
- **Terraform** for multi-cloud infrastructure provisioning
- **Serverless automation** (AWS Lambda, GCP Cloud Functions, Azure Functions)
- **CI/CD-integrated DR playbooks** for proactive testing

The result: a **96% drop in recovery time** and **99.98% SLA compliance**.

---

## Client Overview

**Industry**: Healthcare SaaS  
**Users**: 1,000+ clinics in the U.S. and Canada  
**Key Features**:
- Appointment scheduling
- Secure messaging
- Telehealth integration
- EHR system sync

**Cloud Providers Used**:
- AWS
- Azure
- Google Cloud Platform (GCP)

---

## The Challenge

During an AWS us-east-1 outage, the client's platform experienced:

- 6+ hours of downtime
- No DNS failover automation
- High risk of SLA breach
- Inability to reroute traffic to Azure or GCP
- Manual, untested disaster response

---

## Goals

1. Implement **cross-region failover** in AWS, Azure, and GCP  
2. Automate **DNS and traffic redirection** using serverless functions  
3. Build **multi-cloud DR testing** into CI/CD workflows  
4. Ensure **compliance with healthcare-grade SLAs**

---

## The Solution

### 1. Terraform for Unified Multi-Cloud Provisioning

- Built reusable modules for each provider
- Deployed identical infrastructure across:
  - AWS (`us-east-1`, `us-west-2`)
  - Azure (`centralus`, `westeurope`)
  - GCP (`us-central1`, `europe-west1`)
- Ensured encryption, tagging, and audit logging standards across all clouds

---

### 2. Smart DNS Failover

**Primary Tooling**:
- **AWS Lambda**
- **Route53 health checks**

**Workflow**:
1. Lambda detects region failure via CloudWatch alarms
2. Automatically updates Route53 DNS to redirect to secondary AWS region
3. For non-AWS workloads, DNS updates routed to GCP or Azure endpoints

---

### 3. Redundant Functions in Azure & GCP

- **Azure Functions** monitored telemetry with Application Insights
- **GCP Cloud Functions** watched Pub/Sub triggers for failover events
- Both rerouted internal traffic and scaled backend workloads automatically

---

### 4. DR Automation in CI/CD

Using **GitLab CI**:

- Stage `dr-test` simulated failure scenarios with chaos testing tools
- Stage `validate-dr` confirmed health of all regions and cloud endpoints
- Logs and evidence pushed to ELK stack for audit trail

---

## Impact & Results

| Metric                     | Before         | After          |
|---------------------------|----------------|----------------|
| Recovery Time Objective   | 8 hours        | 20 minutes     |
| Recovery Point Objective  | 4 hours        | 15 minutes     |
| SLA Compliance            | 96%            | 99.98%         |
| Incident Response Time    | 45 mins manual | 5 mins automated |
| Estimated Annual Savings  | N/A            | $400,000+      |

---

## Lessons Learned

- **DR must be treated as a first-class citizen in architecture design**
- **Serverless tools reduce recovery time without increasing ops overhead**
- **CI/CD can validate not just code, but infrastructure resilience**

---

## Tools Used

- **Terraform** (modular provisioning)
- **AWS Lambda + Route53**
- **Azure Functions**
- **GCP Cloud Functions**
- **GitLab CI/CD**
- **CloudWatch, Application Insights, GCP Monitoring**
- **ELK Stack for centralized logging**

---

## Repo Structure

```
├── terraform/
│   ├── aws/
│   ├── azure/
│   └── gcp/
├── functions/
│   ├── lambda/
│   ├── azure/
│   └── gcp/
├── pipelines/
│   ├── dr-tests/
│   └── validation/
└── README.md
```

---

## Author

**Emmanuel Naweji**  
Cloud | DevOps | Resilience Engineering  
Founder @ Transformed 2 Succeed (T2S)  
🔗 [LinkedIn](https://linkedin.com/in/emmanuelnaweji) | [GitHub](https://github.com/Here2ServeU) | [t2s.ai](https://t2s.ai)

---

## License

MIT License  
© 2025 Emmanuel Naweji

![AWS Certified](https://img.shields.io/badge/AWS-Certified-blue?logo=amazonaws)
![Azure Solutions Architect](https://img.shields.io/badge/Azure-Solutions%20Architect-0078D4?logo=microsoftazure)
![CKA](https://img.shields.io/badge/Kubernetes-CKA-blue?logo=kubernetes)
![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform)
![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-blue?logo=githubactions)
![GitLab CI](https://img.shields.io/badge/CI/CD-GitLab%20CI-FC6D26?logo=gitlab)
![Jenkins](https://img.shields.io/badge/CI/CD-Jenkins-D24939?logo=jenkins)
![Ansible](https://img.shields.io/badge/Automation-Ansible-red?logo=ansible)
![ArgoCD](https://img.shields.io/badge/GitOps-ArgoCD-orange?logo=argo)
![VMware](https://img.shields.io/badge/Virtualization-VMware-607078?logo=vmware)
![Linux](https://img.shields.io/badge/OS-Linux-black?logo=linux)
![FinOps](https://img.shields.io/badge/FinOps-Cost%20Optimization-green?logo=money)
![OpenAI](https://img.shields.io/badge/AI-OpenAI-ff9900?logo=openai)
