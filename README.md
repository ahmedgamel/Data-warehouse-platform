# Data Lakehouse Platform - The Business Data Challenges

This is the "Data Lakehouse Platform" project repository. This project is designed to address the critical challenges companies face in managing, processing, and extracting value from their vast data repositories. By leveraging a suite of Azure services, I offer a comprehensive solution to build a data lakehouse - a modern architecture that combines the flexibility of data lakes with the power of data warehouses.

# Key Challenges Addressed

- **Data Silos**: Breaks down data silos by consolidating data from different sources into a centralized data lakehouse, improving data accessibility and visibility.
- **Scalability**: Offers a scalable architecture to handle increasing volumes of data without compromising performance.
- **Data Security and Governance**: Implements robust security measures and governance practices using Azure Key Vault and role-based access controls, ensuring data integrity and compliance.
- **Real-time Analytics**: Facilitates real-time analytics by leveraging Azure Synapse Analytics, providing businesses with timely insights for quicker decision-making.
- **Cost Management**: Optimizes cost through efficient resource management and scalability options, ensuring an economical solution for data storage and processing.


## Data Seller - Project Overview

The "Data Seller" platform leverages the capabilities of Azure cloud services to establish a sturdy and scalable data platform. This project encompasses setups for various services including Azure SQL Database, Azure Data Lake Storage (ADLS), Azure Synapse Analytics, and Azure Key Vault, among others. All these services are adeptly managed and coordinated through Terraform.

In the project repository, there are the Terraform configurations along with Azure Data Factory (ADF) pipelines specifically tailored for the "Data Seller" project. The primary goal of this project is to develop an extensive data platform within Azure, which streamlines the storage, processing, and analysis of data leveraging a range of Azure services.

## Services and Configurations

- **Azure SQL Database**: Data source.
- **Azure Data Lake Storage**: Data storage including the landing zones, RAW, Curated, and Processed.
- **Azure Synapse Analytics**: Data warehousing and big data analytics.
- **Azure Data Factory**: Orchestrator, including a pipeline for ingesting data from Azure SQL to ADLS.
- **Azure Key Vault**: To store secrets, keys, and certificates.
- **Virtual Network and Subnet**: All resources will be on one VNet.
- **Log Analytics Workspace**: To collect and analyze logs and metrics from the services.
- **Azure Monitor Diagnostics**: To monitor the performance and health of the services.

## Getting Started

1. **Prerequisites**:
   - Install [Terraform](https://www.terraform.io/downloads.html).
   - Configure Azure CLI with your Azure account (`az login`).

2. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repository/data-lakehouse-platform.git
   cd data-lakehouse-platform
