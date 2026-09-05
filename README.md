# 🌩️ Oracle Cloud Infrastructure (OCI) - Basic Setup & Best Practices

Repository dedicated to provisioning guides, network architecture, and best practices on **Oracle Cloud Infrastructure (OCI)**, focused on infrastructure automation, security, and high-efficiency workloads.

---

## 📌 Table of Contents

1. [Architecture Overview](#-architecture-overview)
2. [Setup Guide](#-setup-guide)
   - [1. Organization and Isolation (Compartments & IAM)](#1-organization-and-isolation-compartments--iam)
   - [2. Network Architecture (VCN & Subnets)](#2-network-architecture-vcn--subnets)
   - [3. Security Rules (Security Lists & NSGs)](#3-security-rules-security-lists--nsgs)
   - [4. Compute Instances](#4-compute-instances)
   - [5. Post-Configuration & OS Hardening](#5-post-configuration--os-hardening)
3. [Automation (OCI CLI / Terraform)](#-automation)
4. [Contributing & License](#-contributing)

---

## 🏗️ Architecture Overview

The ASCII diagram below illustrates the standard network and security topology to host workloads on OCI with public and private subnet isolation:

