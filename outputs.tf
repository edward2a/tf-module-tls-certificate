output "algorithm" {
  value = tls_private_key.main.algorithm
}

output "private_key_pem" {
  value = tls_private_key.main.private_key_pem
}

output "cert_pem" {
  value = var.type == "SELF_SIGNED" ? tls_self_signed_cert.main[0].cert_pem : (var.type == "LOCAL" ? tls_locally_signed_cert.main[0].cert_pem : null)
}

output "start_time" {
  value = var.type == "SELF_SIGNED" ? tls_self_signed_cert.main[0].validity_start_time : (var.type == "LOCAL" ? tls_locally_signed_cert.main[0].validity_start_time : null)
}

output "end_time" {
  value = var.type == "SELF_SIGNED" ? tls_self_signed_cert.main[0].validity_end_time : (var.type == "LOCAL" ? tls_locally_signed_cert.main[0].validity_end_time : null)
}

output "cert_request_pem" {
  value = contains(["LOCAL", "THIRD_PARTY"], var.type) ? tls_cert_request.main[0].cert_request_pem : null
}