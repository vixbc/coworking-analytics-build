# Coworking Analytics Dashboard

This project is a cloud-native analytics dashboard for coworking space usage, deployed on AWS using EKS, RDS (PostgreSQL), and CloudWatch for observability.

## Project Overview

This dashboard provides daily and user-specific visit insights based on scanned tokens. It is designed to be scalable, observable, and resilient.

## Architecture

- **Backend**: Python Flask API using SQLAlchemy for database access.
- **Database**: PostgreSQL on AWS RDS.
- **Containerization**: Docker.
- **Orchestration**: Kubernetes (EKS).
- **CI/CD**: AWS CodeBuild integrated with GitHub via webhooks.
- **Monitoring**: CloudWatch Container Insights and Cluster Logging.
- **Secrets Management**: Kubernetes Secrets and ConfigMaps.

## Deployment Process

1. Code is pushed to GitHub, triggering AWS CodeBuild.
2. Docker image is built and pushed to Amazon ECR.
3. The Kubernetes deployment is updated using the new image.
4. Environment variables are injected via `ConfigMap` and `Secret`.
5. PostgreSQL tables and seed data are initialized using SQL scripts.
6. Logs and metrics are available in CloudWatch under `aws/containerinsights`.

## Health Monitoring

Endpoints:
- `/health_check`: Basic liveness probe.
- `/readiness_check`: Validates DB connection.

## Getting Started

Use `kubectl apply -f deployment.yaml` to deploy the app. Monitor with `kubectl get pods`, `kubectl logs`, and AWS CloudWatch.
