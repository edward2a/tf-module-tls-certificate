resource "tls_private_key" "main" {
  algorithm   = var.algorithm
  rsa_bits    = var.algorithm == "RSA" ? var.rsa_bits : null
  ecdsa_curve = var.algorithm == "ECDSA" ? var.ecdsa_curve : null
}

resource "tls_self_signed_cert" "main" {
  count = var.type == "SELF_SIGNED" ? 1 : 0

  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name         = var.common_name
    organization        = var.organization
    organizational_unit = var.organizational_unit
    street_address      = var.street_address
    locality            = var.locality
    province            = var.province
    country             = var.country
    postal_code         = var.postcode
    serial_number       = var.serial_number
  }

  dns_names    = var.dns_names
  ip_addresses = var.ip_addresses
  uris         = var.uris

  validity_period_hours = var.validity_period_hours
  allowed_uses          = var.allowed_uses
  early_renewal_hours   = var.early_renewal_hours
  is_ca_certificate     = var.is_ca_certificate
  set_subject_key_id    = var.set_subject_key_id
}

resource "tls_cert_request" "main" {
  count = contains(["LOCAL", "THIRD_PARTY"], var.type) ? 1 : 0

  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name         = var.common_name
    organization        = var.organization
    organizational_unit = var.organizational_unit
    street_address      = var.street_address
    locality            = var.locality
    province            = var.province
    country             = var.country
    postal_code         = var.postcode
    serial_number       = var.serial_number
  }

  dns_names    = var.dns_names
  ip_addresses = var.ip_addresses
  uris         = var.uris
}

resource "tls_locally_signed_cert" "main" {
  count = var.type == "LOCAL" ? 1 : 0

  cert_request_pem      = tls_cert_request.main[0].cert_request_pem
  ca_private_key_pem    = var.ca_private_key_pem
  ca_cert_pem           = var.ca_cert_pem
  validity_period_hours = var.validity_period_hours
  allowed_uses          = var.allowed_uses
  early_renewal_hours   = var.early_renewal_hours
  is_ca_certificate     = var.is_ca_certificate
  set_subject_key_id    = var.set_subject_key_id
}
