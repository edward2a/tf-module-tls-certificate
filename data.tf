locals {
  valid_algorithms = [
    "RSA",
    "ECDSA"
  ]

  valid_ecdsa_curves = [
    "P224",
    "P256",
    "P384",
    "P521"
  ]

  valid_allowed_uses = [
    "digital_signature",
    "content_commitment",
    "key_encipherment",
    "data_encipherment",
    "key_agreement",
    "cert_signing",
    "crl_signing",
    "encipher_only",
    "decipher_only",
    "any_extended",
    "server_auth",
    "client_auth",
    "code_signing",
    "email_protection",
    "ipsec_end_system",
    "ipsec_tunnel",
    "ipsec_user",
    "timestamping",
    "ocsp_signing",
    "microsoft_server_gated_crypto",
    "netscape_server_gated_crypto"
  ]
}