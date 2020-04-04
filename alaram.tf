#---------------------------Alarm for Status check -------------------------#
resource "aws_cloudwatch_metric_alarm" "WORDPRESS-STATUS-CHECK-FAILED" {
  count  = "${var.count}"
  alarm_name                = "${var.metric_name}-STATUS-CHECK-FAILED-${element(aws_eip.EIP.*.public_ip, count.index)}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "StatusCheckFailed"
  namespace                 = "/VERNEMQ/bt-eu-production"
  period                    = "60"
  statistic                 = "Average"
  threshold                 = "1"
  alarm_description         = "IP-${element(aws_eip.EIP.*.public_ip, count.index)}"
  insufficient_data_actions = []
  alarm_actions             = [ "${var.aws_sns_topic_arn}" ]

  dimensions {
    InstanceId = "${element(aws_instance.WORDPRESS.*.id, count.index)}"
  }
}

#---------------------------Alarm for DISK UTILISATION HIGH WARNING -------------------------#
resource "aws_cloudwatch_metric_alarm" "WORDPRESS-DISK-UTILIZATION-HIGH-WARNING" {
  count  = "${var.count}"
  alarm_name                = "${var.metric_name}-DISK-UTILIZATION-HIGH-WARNING-${element(aws_eip.EIP.*.public_ip, count.index)}"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "1"
  metric_name               = "disk_used_percent"
  namespace                 = "/VERNEMQ/bt-eu-production"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = "60"
  alarm_description         = "IP-${element(aws_eip.EIP.*.public_ip, count.index)}"
  insufficient_data_actions = []
  alarm_actions             = [ "${var.aws_sns_topic_arn}" ]


  dimensions {
    InstanceId = "${element(aws_instance.WORDPRESS.*.id, count.index)}"
    path = "/"
    device = "nvme0n1p1"
    fstype = "xfs"
  }
}