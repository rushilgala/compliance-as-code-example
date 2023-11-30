provider "http" {}

# NCSC CAF
data "http" "ncsc_caf" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/85539be55b37247a701a7bf6a18126cf4e625f1f/aws-config-conformance-packs/Operational-Best-Practices-for-NCSC-CAF.yaml"
}

# CIS AWS v1.4 Level2
data "http" "cis_aws_14_level2" {
  url = "https://raw.githubusercontent.com/awslabs/aws-config-rules/85539be55b37247a701a7bf6a18126cf4e625f1f/aws-config-conformance-packs/Operational-Best-Practices-for-CIS-AWS-v1.4-Level2.yaml"
}