variable "allowed_ip_addresses" {
  description = "List of allowed IP addresses"
  type        = list(string)
  default     = []
}

# Define common variables for all modules in DV environment
variable "location" {
  description = "Azure region for resources."
  type        = string
  default     = "East US"
}

# Add more common variables for DV environment as needed
