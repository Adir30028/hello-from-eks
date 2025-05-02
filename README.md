# Flask EKS Deployment

This repository contains a Flask application that is containerized with Docker and deployed to Amazon EKS using Helm, Helmfile, and GitHub Actions.  
The setup supports separate environments for **development** and **production**.

---

## 🚀 Tech Stack

- **Python Flask** – Web app framework  
- **Docker** – Containerization  
- **AWS EKS** – Kubernetes cluster management  
- **Helm + Helmfile** – Kubernetes package manager and environment templating  
- **GitHub Actions** – CI/CD automation  
- **Amazon ECR** – Container image registry  

---

## 🌱 Environments

This project uses two environments:

- `dev` – Auto-deployed on push to `dev` branch  
- `prod` – Auto-deployed on push to `main` branch  

Each environment has its own configuration:

```bash
helm/environments/dev.yaml
helm/environments/prod.yaml
```

And environment-specific values:

```bash
helm/values/dev.yaml
helm/values/prod.yaml
```

---

## 📦 Workflow Overview

On push to `dev` or `main`, GitHub Actions:

- Builds Docker image  
- Pushes to Amazon ECR  
- Updates kubeconfig  
- Installs Helm & Helmfile  
- Applies the correct environment using:

```bash
helmfile -e dev apply  # or prod
```

---

## 🛠️ How to Use

1. Clone this repo  
2. Update secrets in GitHub repository settings:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
   - `ECR_REPOSITORY`
3. Deploy manually (if needed):

```bash
helmfile -e dev apply
```

---

## 🔐 Notes

- `aws-auth.yaml` is ignored via `.gitignore` to prevent committing sensitive role/user mappings.  
- Kubernetes cluster name is assumed to be `flask-eks-eks` (can be changed via `CLUSTER_NAME` secret).  

---

## 📸 Service URL

Once deployed, the Flask app is exposed using a `LoadBalancer` service.  
You can get the external URL using:

```bash
kubectl get svc flask-app-service
```

---

## 🧪 Status

✅ Dev – working  
✅ Prod – tested and deployed  
