locals {
  ncsc_caf_conformance_pack          = split("/", aws_config_conformance_pack.ncsc_caf.arn)
  ncsc_caf                           = element(local.ncsc_caf_conformance_pack, length(local.ncsc_caf_conformance_pack) - 1)
  cis_aws_14_level2_conformance_pack = split("/", aws_config_conformance_pack.cis_aws_14_level2.arn)
  cis_aws_14_level2                  = element(local.cis_aws_14_level2_conformance_pack, length(local.cis_aws_14_level2_conformance_pack) - 1)
}

resource "aws_cloudwatch_metric_alarm" "ncsc_caf" {
  alarm_name          = "ncsc-caf"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  metric_name         = "ComplianceScore"
  namespace           = "AWS/Config"
  period              = 86400
  statistic           = "Maximum"
  threshold           = 50
  alarm_description   = "This metric monitors config compliance with NCSC CAF conformance pack"
  dimensions = {
    ConformancePack = "${aws_config_conformance_pack.ncsc_caf.name}#${local.ncsc_caf}"
  }
  actions_enabled           = "true"
  alarm_actions             = []
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "cis_aws_14_level2" {
  alarm_name          = "cis-aws-14-level2"
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = 1
  evaluation_periods  = 1
  metric_name         = "ComplianceScore"
  namespace           = "AWS/Config"
  period              = 86400
  statistic           = "Maximum"
  threshold           = 50
  alarm_description   = "This metric monitors config compliance with CIS AWS v1.4 Level2 conformance pack"
  dimensions = {
    ConformancePack = "${aws_config_conformance_pack.cis_aws_14_level2.name}#${local.cis_aws_14_level2}"
  }
  actions_enabled           = "true"
  alarm_actions             = []
  ok_actions                = []
  insufficient_data_actions = []
}