variable "algorithm" {
  type    = string
  default = "RSA"

  validation {
    condition     = contains(["RSA", "ECDSA", "ED25519"], var.algorithm)
    error_message = "The CA key algorithm must be one of RSA, ECDSA."
  }
}

variable "rsa_bits" {
  type    = number
  default = 2048
}

variable "ecdsa_curve" {
  type    = string
  default = "P224"

  validation {
    condition     = contains(["P224", "P256", "P384", "P521"], var.ecdsa_curve)
    error_message = "The ECDSA curve must be one of P224, P256, P384, P521."
  }
}

variable "type" {
  type    = string
  default = "SELF_SIGNED"

  validation {
    condition     = contains(["SELF_SIGNED", "LOCAL", "THIRD_PARTY"], var.type)
    error_message = "The type must be one of SELF_SIGNED, LOCAL, THIRD_PARTY."
  }
}

variable "common_name" {
  type    = string
  default = null
}

variable "organization" {
  type    = string
  default = null
}

variable "organizational_unit" {
  type    = string
  default = null
}

variable "street_address" {
  type    = list(string)
  default = null
}

variable "locality" {
  type    = string
  default = null
}

variable "province" {
  type    = string
  default = null
}

variable "country" {
  type    = string
  default = null
}

variable "postcode" {
  type    = string
  default = null
}

variable "serial_number" {
  type    = string
  default = null
}

variable "dns_names" {
  type    = list(string)
  default = null
}

variable "ip_addresses" {
  type    = list(string)
  default = null
}

variable "uris" {
  type    = list(string)
  default = null
}

variable "validity_period_hours" {
  type    = number
  default = 8760
}

variable "allowed_uses" {
  type    = list(string)
  default = ["server_auth"]

  validation {
    condition     = length(setsubtract(var.allowed_uses, ["digital_signature", "content_commitment", "key_encipherment", "data_encipherment", "key_agreement", "cert_signing", "crl_signing", "encipher_only", "decipher_only", "any_extended", "server_auth", "client_auth", "code_signing", "email_protection", "ipsec_end_system", "ipsec_tunnel", "ipsec_user", "timestamping", "ocsp_signing", "microsoft_server_gated_crypto", "netscape_server_gated_crypto"])) == 0
    error_message = "Invalid uses were specified."
  }
}

variable "early_renewal_hours" {
  type    = number
  default = null
}

variable "is_ca_certificate" {
  type    = bool
  default = false
}

variable "set_subject_key_id" {
  type    = bool
  default = false
}

variable "ca_private_key_pem" {
  type    = string
  default = null
}

variable "ca_cert_pem" {
  type    = string
  default = null
}
