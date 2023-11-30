provider "aws" {
  region  = "eu-central-1"
}

resource "aws_config_conformance_pack" "ncsc_caf" {
  name = "ncsc-caf"

  template_body = data.http.ncsc_caf.response_body
}

resource "aws_config_conformance_pack" "cis_aws_14_level2" {
  name = "cis-aws-14-level2"

  template_body = data.http.cis_aws_14_level2.response_body
}