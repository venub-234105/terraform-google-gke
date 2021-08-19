# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# These variables are expected to be passed in by the operator.
# ---------------------------------------------------------------------------------------------------------------------

variable "project" {
  description = "The project ID where all resources will be launched."
  type        = string
  default     = "caldera-321722"
}

variable "location" {
  description = "The location (region or zone) of the GKE cluster."
  type        = string
  default     = "us-west1"
}

variable "region" {
  description = "The region for the network. If the cluster is regional, this must be the same region. Otherwise, it should be the region of the zone."
  type        = string
  default     = "us-west1"
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "caldera-public-cluster"
}

variable "cluster_service_account_name" {
  description = "The name of the custom service account used for the GKE cluster. This parameter is limited to a maximum of 28 characters."
  type        = string
  default     = "caldera-public-cluster-sa"
}

variable "cluster_service_account_description" {
  description = "A description of the custom service account used for the GKE cluster."
  type        = string
  default     = "Public GKE Cluster Service Account managed by Terraform"
}

# For the example, we recommend a /16 network for the VPC. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_cidr_block" {
  description = "The IP address range of the VPC in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
  default     = "10.6.0.0/16"
}

# For the example, we recommend a /16 network for the secondary range. Note that when changing the size of the network,
# you will have to adjust the 'cidr_subnetwork_width_delta' in the 'vpc_network' -module accordingly.
variable "vpc_secondary_cidr_block" {
  description = "The IP address range of the VPC's secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27."
  type        = string
  default     = "10.7.0.0/16"
}

variable "public_subnetwork_secondary_range_name" {
  description = "The name associated with the pod subnetwork secondary range, used when adding an alias IP range to a VM instance. The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the subnetwork."
  type        = string
  default     = "public-cluster"
}

variable "public_services_secondary_range_name" {
  description = "The name associated with the services subnetwork secondary range, used when adding an alias IP range to a VM instance. The name must be 1-63 characters long, and comply with RFC1035. The name must be unique within the subnetwork."
  type        = string
  default     = "public-services"
}

variable "public_services_secondary_cidr_block" {
  description = "The IP address range of the VPC's public services secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. Note: this variable is optional and is used primarily for backwards compatibility, if not specified a range will be calculated using var.secondary_cidr_block, var.secondary_cidr_subnetwork_width_delta and var.secondary_cidr_subnetwork_spacing."
  type        = string
  default     = null
}

variable "private_services_secondary_cidr_block" {
  description = "The IP address range of the VPC's private services secondary address range in CIDR notation. A prefix of /16 is recommended. Do not use a prefix higher than /27. Note: this variable is optional and is used primarily for backwards compatibility, if not specified a range will be calculated using var.secondary_cidr_block, var.secondary_cidr_subnetwork_width_delta and var.secondary_cidr_subnetwork_spacing."
  type        = string
  default     = null
}

variable "secondary_cidr_subnetwork_width_delta" {
  description = "The difference between your network and subnetwork's secondary range netmask; an /16 network and a /20 subnetwork would be 4."
  type        = number
  default     = 4
}

variable "secondary_cidr_subnetwork_spacing" {
  description = "How many subnetwork-mask sized spaces to leave between each subnetwork type's secondary ranges."
  type        = number
  default     = 0
}

variable "enable_vertical_pod_autoscaling" {
  description = "Enable vertical pod autoscaling"
  type        = string
  default     = true
}

variable "enable_workload_identity" {
  description = "Enable Workload Identity on the cluster"
  default     = true
  type        = bool
}

# ---------------------------------------------------------------------------------------------------------------------
# Environment variables
# These parameters are set by Terraform environment variables in the github workflow
# ---------------------------------------------------------------------------------------------------------------------

variable "AUTHTIME_CLIENT_ID" {
  description = "Auth time client ID"
  type        = string
  default     = "31fb6700b8a2418ea34541f0"
}

variable "AUTHTIME_CLIENT_SECRET" {
  description = "Auth time client secret"
  type        = string
  default     = "16033864906aa2bcdcd585eb"
}

variable "AUTHTIME_HOST" {
  description = "Auth time host"
  type        = string
  default     = "auth.qa.data-axle.com"
}

variable "AUTHTIME_TOKEN_URI" {
  description = "Auth time token"
  type        = string
  default     = "/oauth/token"
}

variable "AUTHTIME_PROFILE_URI" {
  description = "Auth time profile URI"
  type        = string
  default     = "/api/me"
}

variable "AUTHTIME_INVITATION_URI" {
  description = "Auth time Invitation URI"
  type        = string
  default     = "/api/invitations"
}
variable "OAUTH_REDIRECT_URL" {
  description = "OAuth redirect URL"
  type        = string
  default     = "http://caldera-apps.s3-website-us-east-1.amazonaws.com/oauth-callback"
}

variable "OAUTH_INVITER_ID" {
  description = "OAuth inviter ID"
  type        = string
  default     = "1833d1bc568c748bae7e97fd"
}
variable "SPARKPOST_API_KEY" {
  description = "Sparkpost API key"
  type        = string
  default     = "feaebe8c4b81741a440391f71be00c707ffc4d1b"
}
variable "CALDERA_SERVER_SECRET_KEY" {
  description = "Caldera Server secret key"
  type        = string
  default     = "8wh1e089p9kl8tufxo0Azz0iuftx7AwfrnvQutAhN3tL1mba4j"
}

variable "OAUTH_ORG_ID" {
  description = "Oauth Org Id"
  type        = string
  default     = "134"
}

variable "RDS_USERNAME" {
  description = "Database username"
  type        = string
  default     = "admin"
}

variable "RDS_PASSWORD" {
  description = "Database Passwords"
  type        = string
  default     = "admin"
}

variable "GKE_NAMESPACE" {
  description = "Namespace where the app needs to be deployed (test/prod)"
  type        = string
  default     = "test"
}

# ---------------------------------------------------------------------------------------------------------------------
# TEST PARAMETERS
# These parameters are only used during testing and should not be touched.
# ---------------------------------------------------------------------------------------------------------------------

variable "override_default_node_pool_service_account" {
  description = "When true, this will use the service account that is created for use with the default node pool that comes with all GKE clusters"
  type        = bool
  default     = false
}
