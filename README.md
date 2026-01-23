# Automated Docker Build & Deployment Pipeline Using GitHub Actions (Ubuntu + Apache)

This repository demonstrates an end-to-end **CI/CD pipeline** using **GitHub Actions** to automate the process of building, pushing, deploying, and verifying a Dockerized Apache web server running on Ubuntu.

On every push to the `main` branch, the pipeline:
- Builds a Docker image
- Pushes the image to Docker Hub
- Pulls and runs the container on a fresh environment
- Verifies the deployment using an integration test

This project is designed to showcase real-world **DevOps CI/CD practices** using modern tooling.

---

## 🏗️ CI/CD Architecture Flow

<p align="center">
  <img src="images/Architecture Diagram.png" alt="CI/CD Architecture" width="800"/>
</p>

---

## 🛠️ Technologies Used

- **GitHub Actions** – CI/CD automation  
- **Docker** – Containerization platform  
- **Docker Hub** – Container image registry  
- **Ubuntu (latest)** – Base operating system  
- **Apache HTTP Server** – Web server  
- **HTML / CSS** – Static website  

---

## 📁 Repository Structure

<p align="center">
  <img src="images/Repository Structure.png" alt="Repository Structure" width="800"/>
</p>

---

## ⚙️ GitHub Actions Workflow Details

### 🔹 Job 1: Build & Push

Runs on a GitHub-hosted `ubuntu-latest` runner.

**Steps performed:**
- Checkout source code
- Authenticate with Docker Hub
- Build Docker image using `Dockerfile`
- Push image to Docker Hub repository

### 🔹 Job 2: Deploy & Verify

Runs on a **new and clean runner** after Job 1 succeeds.

**Steps performed:**
- Authenticate with Docker Hub
- Pull the latest Docker image
- Run Apache container in detached mode
- Verify application using `curl`

This simulates a real deployment environment where containers are pulled and started dynamically.

---

## 🐳 Docker Image Configuration

**Base Image**
```dockerfile
FROM ubuntu:latest
```

**Installed Package**
```dockerfile
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean
```

**Copy Index.html**
```dockerfile
COPY index.html /var/www/html/index.html
```

**Port Exposure**
```dockerfile
EXPOSE 80
```

**Startup Command**
```dockerfile
CMD ["apache2ctl", "-D", "FOREGROUND"]
```
Apache runs in the foreground to keep the container alive.

---

## 🔐 Required GitHub Secrets

To run this pipeline successfully, configure the following secrets in your GitHub repository:
| Secret Name       | Description                                                                 |
|-------------------|-----------------------------------------------------------------------------|
| DOCKER_USERNAME   | Your Docker Hub account username.                                           |
| DOCKER_PASSWORD   | Your Docker Hub personal access token (recommended) or account password.   |

### Configuration Path
```nginx
Repository → Settings → Secrets and variables → Actions
```

---

## 🚀 How to Use This Project

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/Automated-Docker-Build-Deployment-Pipeline-Using-GitHub-Actions-Ubuntu-Apache.git
cd Automated-Docker-Build-Deployment-Pipeline-Using-GitHub-Actions-Ubuntu-Apache
```

### 2. Push Changes to Trigger Pipeline
```bash
git add .
git commit -m "Trigger CI/CD pipeline"
git push origin main
```

### 3. Monitor the Pipeline
- Go to GitHub → Actions
- Observe build, push, deploy, and verification stages

---

## 🎯 Learning Outcomes
- Designing CI/CD pipelines with GitHub Actions
- Docker image build and registry push
- Multi-job workflow orchestration
- Container-based application deployment
- Integration testing in CI environments
- Real-world DevOps pipeline implementation
