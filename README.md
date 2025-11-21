# My Vite App – CI/CD Pipeline & Minikube Deployment

## ## Group Members

* **Munaza Malik (44956)** – Leader
* **Areeba Sadaqat (47633)** – Member

---

## ## Technologies Used

* **Vite** – Frontend build tool
* **Docker** – Containerization
* **GitHub Actions** – CI/CD automation
* **AWS EC2** – Cloud deployment
* **Minikube** – Local Kubernetes testing

---

# Project Overview

This project demonstrates a complete CI/CD setup for a Vite application using Docker, GitHub Actions, AWS EC2, and Minikube.
It covers:
 Frontend development with Vite
 Docker image creation
 Automated CI/CD pipeline
 Deployment to AWS EC2
 Kubernetes deployment using Minikube

---

# CI/CD Pipeline Description

The CI/CD pipeline triggers whenever code is pushed to the **main** branch.

### **Pipeline workflow:**

1. GitHub Actions builds the project.
2. Creates a Docker image of the Vite application.
3. Pushes the image to **Docker Hub**.
4. SSHes into the **AWS EC2** server.
5. Pulls the updated Docker image.
6. Runs the latest container automatically.

---

# How to Run the Project Locally

### **1. Install Dependencies**

```bash
npm install
```

### **2. Run Development Server**

```bash
npm run dev
```

### **3. Build for Production**

```bash
npm run build
```

### **4. Build Docker Image**

```bash
docker build -t munazamalik/my-vite-app:latest .
```

### **5. Run Docker Container**

```bash
docker run -d -p 80:80 munazamalik/my-vite-app:latest
```

---

# 🌐 How Deployment Works (EC2 CI/CD)

1. GitHub Actions builds and pushes this Docker image:
   `munazamalik/my-vite-app:latest`
2. Workflow SSHes into EC2.
3. EC2 pulls the new image:

   ```bash
   docker pull munazamalik/my-vite-app:latest
   ```
4. EC2 runs the updated container:

   ```bash
   docker run -d -p 80:80 munazamalik/my-vite-app:latest
   ```

---

# ☸️ Minikube Deployment (Local Kubernetes)

## **1. Start Minikube**

```bash
minikube start --driver=docker --cpus=2 --memory=2048 --disk-size=6g
```

## **2. Use Minikube’s Docker Daemon**

```bash
& minikube -p minikube docker-env | Invoke-Expression
```

## **3. Build Docker Image Inside Minikube**

```bash
docker build -t my-react-app:latest .
```

## **4. Apply Deployment & Service**

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## **5. Verify**

```bash
kubectl get pods
kubectl get svc
```

## **6. Open App via Minikube**

```bash
minikube service my-react-service
```

---

# 📸 Documentation & Proof

### **📌 Screenshot 1: `kubectl get pods`**

> *(Insert screenshot here)*

---

### **📌 Screenshot 2: Application Running Through Minikube URL**

> *(Insert screenshot here)*

---

# 📝 Changelog

* **2025-10-10:** Added CI/CD pipeline with Docker Hub push + EC2 deployment
* **2025-11-21:** Added Minikube deployment steps and documentation screenshots section

---

If you want this in **PDF**, **DOCX**, or want me to **add architecture diagrams**, feel free to ask!
