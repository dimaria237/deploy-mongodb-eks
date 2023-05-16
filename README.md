# deploy-mongodb-eks

Installation

step 1

√ deploy the VPC
 
 - The VPC is deployed from the terraform-aws-modules/vpc/aws module
 - √ version 4.0.2

 - Set up AWS credentials and configure the AWS provider in your Terraform code.
 - Create a VPC, subnets, and security groups to house your EKS cluster resources.


 step 2 

 √ deploy the eks cluster

 - The EKS cluster is deployed from the "terraform-aws-modules/eks/aws"
 - √ version = "19.13.1"

 step 3

 √ deploy the MongoDB to the EKS cluster

   - Use the Kubernetes `Deployment` and `Service` resources to deploy MongoDB on the EKS cluster.
   - Define the MongoDB replica set configuration in the Kubernetes `Deployment` manifest, specifying the number of replicas, storage volume   sizes, authentication settings, and any other required configurations.
   - Configure persistent volume claims (PVCs) to ensure data persistence for the MongoDB cluster.
   - Define a Kubernetes `Service` manifest to expose the MongoDB cluster internally or externally as needed.

 <!-- 
 kubectl apply -f deployment.yaml
 kubectl apply -f service.yaml -->


 Security and Reliability
 
 √ Restrict network access: Use security groups or network policies to limit inbound and outbound traffic to only necessary ports and IP ranges.
 √ Enable encryption: Configure MongoDB to use TLS/SSL for network communication to encrypt data in transit.
 √ Use private subnets: Deploy your MongoDB cluster in private subnets, accessible only through secure channels like VPN or AWS Direct Connect.
 √ Configure the MongoDB cluster to utilize persistent volumes (PVs) to store data persistently. Either Amazon EBS or Amazon EFS for PV provisioning.
√ Implement proper authentication and authorization mechanisms for MongoDB, such as configuring authentication credentials and roles.
√ Implement monitoring and logging solutions for both the EKS cluster and the MongoDB cluster to ensure visibility into their performance and health.

  
Data Migration Strategy

√ - Assess the size and complexity of the existing MongoDB data (1500GB) to estimate the migration time and plan for any necessary downtime.
√ - One option is to use MongoDB native tools like `mongodump` and `mongorestore` to export the data from the old cluster and import it into the new cluster. This method may require downtime during the actual data transfer.
√ - Alternatively, you can explore using database replication techniques (such as MongoDB replica sets) to achieve a live migration with minimal downtime. This method involves setting up a replica set on the new cluster, adding the old cluster as a replica member, allowing data synchronization, and then promoting the new cluster as the primary.

 * Consider network bandwidth and latency between the old cluster and the new cluster to estimate the migration time and plan accordingly.
