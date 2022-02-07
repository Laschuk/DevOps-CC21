# README

[Source](https://github.com/hashicorp/terraform-provider-aws/tree/main/examples/eks-getting-started)

## Before deploying infrastructure, you need to do:
- Export your AWS credentials
```bash
export AWS_ACCESS_KEY_ID=your_key
export AWS_SECRET_ACCESS_KEY=your_secret
export AWS_DEFAULT_REGION=eu-central-1
```
- Create AWS S3 bucket for terraform state
- Create AWS DynamoDB table with partition key `LockID` type `string`
- Change the values for the terraform backend in the `./provider.tf`
```tf
  backend "s3" {
    bucket         = "YOUR_BUCKET"
    key            = "PATH/TO/terraform.tfstate"
    region         = "eu-central-1" # Change if need
    dynamodb_table = "YOUR_DYNAMODB_TABLE"
  }
```
- Change values in `./variables.tf`, or apply with -var
```bash
terraform apply -auto-approve \
  -var="cluster-name" \
  -var="desired_size=3" \
  -var="max_size=4" \
  -var="instance_type=t2.micro"

```

## Setting up a config file for kubectl

- Make copy current config file
```bash
cp ~/.kube/config ~/.kube/config_$(date +%Y-%m-%d_%H-%M-%S)
```
- Setting up new config
```bash
terraform output kubeconfig | sed -e "/EOT/d" -e "/^$/d" > ~/.kube/config
```
- Check cluster
```bash
kubectl cluster-info
```