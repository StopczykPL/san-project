provider "aws" {
region                  = "us-east-1"
shared_credentials_file = "/home/jaroslaw.golab/.aws/credentials"
profile                 = "jarek-dev-ops"
}

provider "kubernetes" {
host                   = aws_eks_cluster.ekscluster.endpoint
cluster_ca_certificate = base64decode(aws_eks_cluster.ekscluster.certificate_authority[0].data)
token                  = data.aws_eks_cluster_auth.eksauth.token
}