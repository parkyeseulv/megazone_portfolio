variable "" {
  type        = string
  description = ""
  default = ""
}

variable "project_id" {
  type        = string
  default     = "hybrid-bts"
}

variable "network_name" {
  type        = string
  description = ""
  default = "bts-vpc"
}
variable "region" {
  type        = string
  description = ""
  default = "asia-northeast3"
}

variable "zone" {
  type        = string
  description = ""
  default = "asia-northeast3-a"
}

variable "priv_sub_1" {
  type        = string
  description = ""
  default = "bts-priv-sub-1"
}

variable "priv_sub_2" {
  type        = string
  description = ""
  default = "bts-priv-sub-2"
}

variable "cidr" {
  type        = string
  description = ""
  default = "10.0.0.0/16"
}

variable "priv_1_cidr" {
  type        = string
  description = ""
  default = "10.0.2.0/24"
}

variable "priv_2_cidr" {
  type        = string
  description = ""
  default = "10.0.3.0/24"
}

variable "state_bucket_name" {
  type        = string
  description = ""
  default = "bts-terraform"
}
