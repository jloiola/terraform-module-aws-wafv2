provider "aws" {
  region = "us-east-1"
}

# at-all from https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl
resource "aws_wafv2_web_acl" "this" {
  name        = var.name
  description = "Example of a managed rule"
  scope       = var.scope

  default_action {
    allow {}
  }

  # sample rule which has its own visibility
  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"

        excluded_rule {
          name = "SizeRestrictions_QUERYSTRING"
        }

        excluded_rule {
          name = "NoUserAgent_HEADER"
        }
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "friendly-rule-metric-name"
      sampled_requests_enabled   = true
    }
  }

  tags = merge(var.tags, {
      "managed-by" = "terraform"
  })

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "friendly-metric-name"
    sampled_requests_enabled   = true
  }
}
