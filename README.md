# Data Seller - Azure Data Platform

This repository contains the Terraform configurations and Azure Data Factory (ADF) pipelines for the "Data Seller" project. The project aims to set up a comprehensive data platform in Azure, facilitating the storage, processing, and analysis of data using various Azure services.

## Overview

The Data Seller platform is designed to harness the power of Azure cloud services to create a robust and scalable data platform. The project includes configurations for services such as Azure SQL Database, Azure Data Lake Storage (ADLS), Azure Synapse Analytics, Azure Key Vault, and more, managed and orchestrated using Terraform.

## Services and Configurations

- **Azure SQL Database **: Data source.
- **Azure Data Lake Storage **: data storage including the landing zones, RAW, Curated, Processed.
- **Azure Synapse Analytics **: Data warehousing and big data analytics.
- **Azure Data Factory **: Orchestrator, including a pipeline for ingesting data from Azure SQL to ADLS.
- **Azure Key Vault **: To store secrets, keys, and certificates.
- **Virtual Network and Subnet **: All resources will be on one VNet.
- **Log Analytics Workspace **: To collect and analyze logs and metrics from the services.
- **Azure Monitor Diagnostics **: To monitor the performance and health of the services.

## Getting Started

1. **Prerequisites**:
   - Install [Terraform](https://www.terraform.io/downloads.html).
   - Configure Azure CLI with your Azure account (`az login`).

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repository/data-seller.git
   cd data-seller
