config_rules_list = {
  
  # "iam-policy-in-use" = {
  # input_params = true,
  # parameters = {
  # "policyARN" = "arn:aws:iam::809244893916:user/jitender@gmail.com" } },

   "approved-amis-by-id" = {
    input_params = true,
    parameters = {
  "amiIds" = "ami-0e731c8a588258d0d" } },

  "s3-bucket-blacklisted-actions-prohibited" = {
    input_params = true,
    parameters = {
  "blacklistedActionPattern" : "s3:DeleteObject" } },

  "s3-bucket-versioning-enabled" = {
  input_params = false }

  "cloud-trail-enabled" = {
  input_params = false }

  "cloudtrail-s3-dataevents-enabled" = {
  input_params = false }

  "cloudtrail-security-trail-enabled" = {
  input_params = false }

  "cloud-trail-cloud-watch-logs-enabled" = {
  input_params = false }

  "ec2-ebs-encryption-by-default" = {
  input_params = false }

  "account-part-of-organizations" = {
  input_params = false }

  "ec2-instance-detailed-monitoring-enabled" = {
  input_params = false }

  "ec2-launch-template-public-ip-disabled" = {
  input_params = false }

  "internet-gateway-authorized-vpc-only" = {
  input_params = false },

  "s3-access-point-in-vpc-only" = {
  input_params = false },

  "s3-access-point-public-access-blocks" = {
  input_params = false },

  "s3-bucket-level-public-access-prohibited" = {
  input_params = false },

  "s3-bucket-logging-enabled" = {
  input_params = false },

  "s3-account-level-public-access-blocks" = {
  input_params = false },

  "s3-bucket-replication-enabled" = {
  input_params = false },

  "s3-bucket-server-side-encryption-enabled" = {
  input_params = false },

  "s3-default-encryption-kms" = {
  input_params = false },

  "secretsmanager-rotation-enabled-check" = {
  input_params = false },

  "secretsmanager-scheduled-rotation-success-check" = {
  input_params = false },

  "secretsmanager-secret-periodic-rotation" = {
  input_params = false },

  "subnet-auto-assign-public-ip-disabled" = {
  input_params = false },

  "vpc-default-security-group-closed" = {
  input_params = false },

  "vpc-flow-logs-enabled" = {
  input_params = false },

  "wafv2-logging-enabled" = {
  input_params = false },

  "waf-classic-logging-enabled" = {
  input_params = false }

  "ec2-instance-no-public-ip" = {
  input_params = false }
  

}
