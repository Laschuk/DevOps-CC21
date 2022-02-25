# An Identity and Access Management (IAM) role is an IAM identity that you can create in your account 
# that has specific permissions. An IAM role is similar to an IAM user, in that it is an AWS identity 
# with permission policies that determine what the identity can and cannot do in AWS. However, instead 
# of being uniquely associated with one person, a role is intended to be assumable by anyone who needs 
# it. Also, a role does not have standard long-term credentials such as a password or access keys 
# associated with it. Instead, when you assume a role, it provides you with temporary security 
# credentials for your role session.
# https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles.html

# Resource: aws_iam_role
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role

resource "aws_iam_role" "eks_cluster" {
  # The name of the role
  name = local.cluster-name

  # The policy that grants an entity permission to assume the role.
  # Used to acces AWS resources that you migth not normally have access to.
  # The role that Amazon EKS will use to create AWS resources for Kubernetes cluster
  assume_role_policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
POLICY
}
