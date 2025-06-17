
# Go Web Application – DevOps Edition

[![CI pipeline](https://github.com/HasanAshab/go-web-app-devops/actions/workflows/ci.yaml/badge.svg?event=push)](https://github.com/HasanAshab/go-web-app-devops/actions/workflows/ci.yaml)
[![Terraform CI-CD pipeline](https://github.com/HasanAshab/go-web-app-devops/actions/workflows/terraform-cicd.yaml/badge.svg)](https://github.com/HasanAshab/go-web-app-devops/actions/workflows/terraform-cicd.yaml)
[![1]](https://github.com/HasanAshab/go-web-app-devops/pkgs/container/go-web-app-devops)


[1]: <https://ghcr-badge.egpl.dev/hasanashab/go-web-app-devops/size>

This is a DevOps-enhanced deployment of a [basic Golang web application](https://github.com/iam-veeramalla/go-web-app), restructured and productionized with best practices for containerization, CI/CD, and Kubernetes.

---

## 🚀 DevOps Features Implemented

* **Dockerized Build**: Multi-stage Dockerfile for efficient image creation.
* **Local Development**: `docker-compose` support with live reload for rapid iteration.
* **Kubernetes Deployment**: Complete manifest files for deployment on **_AWS EKS_**.
* **Helm Charts**: Configurable Kubernetes manifests.
* **Ingress Management**: Ingress Controller (**_NGINX_**) for routing and external access.
* **CI with GitHub Actions**: [See more](#️cicd-pipeline).
* **CD via Argo CD**: [See more](#️cicd-pipeline).

---

## 🧑‍💻 Local Development

To spin up the application locally with Docker:

```bash
docker-compose up
```

Once running, the server will be accessible at:
**[http://localhost:8080/courses](http://localhost:8080/courses)**

**Live reload** is enabled—code changes will be reflected instantly in the container.

---

## 📷 UI Preview

![Web Preview](static/images/golang-website.png)

---

## ⚙️ CI/CD Pipeline

This project is equipped with a robust CI/CD pipeline:

- **CI (GitHub Actions)**:
![CI Diagram](static/images/ci.png)
- **CD (Argo CD)**:
![CD Diagram](static/images/cd.png)

---

## 🛠️ Prerequisites (for Prod Deployment)

* AWS EKS Cluster
* Argo CD configured and running
* Helm 3+
* NGINX Ingress Controller installed
* Docker and kubectl installed

---

## 📈 Future Improvements

* Add integration tests to CI
* Add Prometheus/Grafana integration
* Implement healthcheck endpoints and readiness probes

---

## 🙋‍♂️ About Me
**Hasan Ashab** – DevOps Engineer  
LinkedIn: [@hasan-ashab](https://www.linkedin.com/in/hasan-ashab-b9b20a290)
Portfolio: Under development
---
