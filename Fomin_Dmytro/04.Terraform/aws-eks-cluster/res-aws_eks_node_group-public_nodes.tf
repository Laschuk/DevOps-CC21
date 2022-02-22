
# Amazon EKS managed node groups automate the provisioning and lifecycle management of nodes (Amazon EC2 instances) 
# for Amazon EKS Kubernetes clusters.
# With Amazon EKS managed node groups, you don’t need to separately provision or register the Amazon EC2 instances 
# that provide compute capacity to run your Kubernetes applications. You can create, automatically update, or terminate
# nodes for your cluster with a single operation. Node updates and terminations automatically drain nodes to ensure 
# that your applications stay available.
# https://docs.aws.amazon.com/eks/latest/userguide/managed-node-groups.html

# Resource: aws_eks_node_group
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group

resource "aws_eks_node_group" "public_nodes" {
  # Name of the EKS Cluster.
  cluster_name = aws_eks_cluster.cluster.name

  # Name of the EKS Node Group.
  node_group_name = "public_nodes"

  # Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group.
  node_role_arn = aws_iam_role.nodes.arn

  # Identifiers of EC2 Subnets to associate with the EKS Node Group. 
  # These subnets must have the following resource tag: kubernetes.io/cluster/CLUSTER_NAME 
  # (where CLUSTER_NAME is replaced with the name of the EKS Cluster).
  subnet_ids = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  # Configuration block with scaling settings
  scaling_config {
    # Desired number of worker nodes.
    desired_size = var.public-nodes-desired-capacity

    # Maximum number of worker nodes.
    max_size = var.public-nodes-max-size

    # Minimum number of worker nodes.
    min_size = var.public-nodes-min-size
  }

  # Type of Amazon Machine Image (AMI) associated with the EKS Node Group.
  # Valid values: AL2_x86_64, AL2_x86_64_GPU, AL2_ARM_64, CUSTOM
  ami_type = "AL2_x86_64"

  # List of instance types associated with the EKS Node Group
  instance_types = ["${var.public-nodes-instance-type}"]

  # Type of capacity associated with the EKS Node Group. 
  # Valid values: ON_DEMAND, SPOT
  capacity_type = "SPOT"

  # Disk size in GiB for worker nodes
  disk_size = 20

  # Force version update if existing pods are unable to be drained due to a pod disruption budget issue.
  force_update_version = false

  update_config {
    # Desired max number of unavailable worker
    # nodes during node group update.
    max_unavailable = 1
  }

  remote_access {
    ec2_ssh_key               = "eks-key"
    source_security_group_ids = [aws_security_group.worker_nodes_ssh_access.id]
  }

  labels = {
    role = "public-nodes"
  }

  # taint {
  #   key = "team"
  #   value = "devops"
  #   effect = "NO_SCHEDULE"
  # }

  # launch_launch_template {
  #   name  = aws_launch_template.eks-with-disks.name
  #   version = aws_launch_template.eks-with-disks.latest-version
  # }

  # Kubernetes version
  version = "1.18"

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.nodes_AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes_AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes_AmazonEC2ContainerRegistryReadOnly,
  ]
}


# resource "aws_launch_template" "eks-with-disks" {
#   name = "eks-with-disks"
#   key_name = "local-provisioner"

#   block_device_mappings {
#     device_name = "/dev/xvdb"
#   }

#   ebs {
#     volume_size = 50
#     volume_type = "gp2"
#   }
# }
