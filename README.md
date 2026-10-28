# Weather App on AKS: Multi-Environment Azure Platform with Terraform and GitHub Actions

- **Author:** Mimi Dib 
- **GitHub Link:** [mimidib](https://github.com/mimidib)
- **Date:** 2026-10-26

## Overview

This project deploys **Azure Kubernetes Service (AKS)** clusters and a **managed Redis DB** to support the Remix Weather Application (app provided by Algonquin College). It utilizes **GitHub Actions CI/CD pipelines** to automate the Terraform workflows.

The infrastructure uses a remote Terraform backend, with the state file stored securely in **Azure Blob Storage** so multiple contributors can work on it safely. The Terraform code is organized into reusable modules to manage resources neatly and efficiently.

This project simulates a real-world scenario, with a code reviewer to approve/deny pull requests, and multiple environments to manage, namely: `dev`, `test`, and `prod`.

## Credits

- **Project brief:** Prof. Robert McKenney, CST8918 – DevOps: Infrastructure as Code, Algonquin College
- **Remix Weather Application:** provided by the course as the sample app to deploy
- **Everything else:** Terraform modules, network design, AKS and Redis configuration, Kubernetes manifests, and GitHub Actions workflows were designed and built by me
