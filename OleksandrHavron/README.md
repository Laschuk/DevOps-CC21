## Pre-requirements
- Jenkins >= 2.334
- Jenkins plugins:
    - [Git](https://plugins.jenkins.io/git)
    - [AWS](https://www.jenkins.io/doc/pipeline/steps/pipeline-aws/)

- Environment where Jenkins will execute jobs:
    - [Docker](https://docs.docker.com/engine/install/ubuntu/), [docker-compose](https://docs.docker.com/compose/install/) == 3.3
    - [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
    - [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
    - [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
    - [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
    - [Helm](https://helm.sh/docs/intro/install/)

## Jenkins configuration
1. Create Docker credentials with id="docker-hub-creds".
2. Create AWS credentials with id="Amazon creds".

## Create Terraform backend
1. Create AWS S3 bucket.
2. Change atribute 'bucket' in versions.tf file to created bucket name.

## Create env files
1. Create file .env.local
```
POSTGRES_DB={PostgreSQL DB name}
POSTGRES_USER={PostgreSQL username}
POSTGRES_PASSWORD={PostgreSQL user password}
PG_HOST=postgres
DB_PORT=5432
MONGO_INITDB_DATABASE={MongoDB DB name}
MONGO_INITDB_ROOT_USERNAME={MongoDB username}
MONGO_INITDB_ROOT_PASSWORD={MongoDB user password}
```
2. Create file .env
```
SECRET_KEY={Secret key for Django}
DEBUG={True or False}
DB_NAME={PostgreSQL DB name}
DB_USER={PostgreSQL username}
DB_PASSWORD={PostgreSQL user password}
PG_HOST=postgres
DB_PORT=5432
MONGODB_NAME={MongoDB DB name}
MONGODB_USER={MongoDB username}
MONGODB_USER_PASS={MongoDB user password}
MONGODB_HOST=mongo
```
3. Create AWS S3 bucket for storing env files.
4. Upload created files to S3 bucket.
5. Change "Downolad env files" stage with your values.

## Monitoring
1. Sign up [DataDog](https://app.datadoghq.com/signup).
2. Create Jenkins credentials of Datadog API Key with id="datadog-key".

## Create Jenkins jobs
> *Change row "agent {...}" to "agent any" in all Jenkinsfiles.*
- terraform.Jenkinsfile for creating cloud infrastructure(VPC, EKS).
- build.Jenkinsfile for building aplication and uploading to docker hub builded images.
- deploy.Jenkinsfile for deploy images to EKS cluster.
- monitoring.Jenkinsfile for deploy monitoring.
- update_deploy.Jenkinsfile for update images in EKS cluster.
