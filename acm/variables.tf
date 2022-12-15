variable "domain_names" {
  description = "List of domains to associate with the new certificate. ACM currently supports up to 10 domains, any or all of which can contain wildcards. The first domain should be the primary domain"
  type = "list"
}

variable "zone_id" {
  description = "The Route53 zone ID in which to create validation records"
  default = ""
}

variable "zone_ids" {
  description = "Map of zone IDs indexed by domain name (when issuing a certificate spanning multiple zones)"
  type = "map"
  default = {}
}

variable "business_name" {
  type        = string
  description = "Business Name"
}

variable "service_name" {
  type        = string
  description = "Service name"
}

variable "subservice_name" {
  type        = string
  description = "Sub Service name"
}

variable "environment" {
  description = "environment to deploy into, should typically dev/staging/prod"
  type        = string
}