# tf-module-tls-certificate
Terraform configuration for a TLS certificate
(provided by https://github.com/tombotch)

## Sample
NOTE: You will need to add some file resources (local_file provider) to output the certs to the filesystem.
```
module "ca_cert" {
  source = "git::https://github.com/edward2a/tf-module-tls-certificate?ref=master"

  organization = "Local Labs"
  country = "UK"
  is_ca_certificate = true
  allowed_uses = [
    "digital_signature",
    "cert_signing",
    "crl_signing",
    "any_extended",
    "ocsp_signing"
  ]
}

module "server_cert" {
  source = "git::https://github.com/edward2a/tf-module-tls-certificate?ref=master"

  type = "LOCAL"
  ca_private_key_pem = module.ca_cert.private_key_pem
  ca_cert_pem = module.ca_cert.cert_pem

  common_name = "*.example.local"
  organization = "Local Labs"
  country = "UK"
  dns_names = [
    "*.example.local",
    "*.dev.example.local"
  ]
}
```

## Variables
| Name | Type | Description | Required | Default | Permitted values |
| ---- | ---- | ----------- | -------- | ------- | ---------------- |
| algorithm | string | The algorithm to generate the private key with | No | RSA | RSA<br />ECDSA |
| rsa_bits | number | The bit length of the RSA private key | No | 2048 | |
| ecdsa_curve | string | The ECDSA curve to use to generate the private key | No | P224 | P224<br />P256<br />P384<br />P521 |
| type | string | The type of certificate to create | No | SELF_SIGNED | SELF_SIGNED<br />LOCAL<br />THIRD_PARTY |
| common_name | string | The common name of the certificate | No | null | |
| organization | string | The organisation to add to the certificate | No | null | |
| organizational_unit | string | The organisational unit to add to the certificate | No | null | |
| street_address | string | The street address to add to the certificate | No | null | |
| locality | string | The locality to add to the certificate | No | null | |
| province | string | The province to add to the certificate | No | null | |
| country | string | The country to add to the certificate | No | null | |
| postcode | string | The postcode to add to the certificate | No | null | |
| serial_number | string | The serial number to add to the certificate | No | null | |
| dns_names | list(string) | The DNS SANs to add to the certificate | No | [] | |
| ip_addresses | list(string) | The IP address SANs to add to the certificate | No | [] | |
| uris | list(string) | The URI SANs to add to the certificate | No | [] | |
| validity_period_hours | number | The validity period of the certificate in hoursa | No | 8760 | |
| allowed_uses | list(string) | The allowed uses of the certificate | No | ["server_auth"] | digital_signature<br />content_commitment<br />key_encipherment<br />data_encipherment<br />key_agreement<br />cert_signing<br />crl_signing<br />encipher_only<br />decipher_only<br />any_extended<br />server_auth<br />client_auth<br />code_signing<br />email_protection<br />ipsec_end_system<br />ipsec_tunnel<br />ipsec_user<br />timestamping<br />ocsp_signing<br />microsoft_server_gated_crypto<br />netscape_server_gated_crypto | |
| early_renewal_hours | number | The number of hours before expiry to renew the certificate | No | null | |
| is_ca_certificate | bool | Whether a CA certificate is being generated | No | false | |
| set_subject_key_id | bool | Whether to include the subject key identifier | No | false | |
| ca_key_algorithm | string | The algorithm used to generate the CA private key | Yes (`LOCAL` only) | null | |
| ca_private_key_pem | string | The CA private key in PEM format | Yes (`LOCAL` only) | null | |
| ca_cert_key_pem | string | The CA public key in PEM format | Yes (`LOCAL` only) | null | |

## Outputs
| Name | Description |
| ---- | ----------- |
| algorithm | The algorithm used to generate the private key |
| private_key_pem | The private key in PEM format |
| cert_pem | The signed certificate in PEM format |
| start_time | The start time of the certificate validity period |
| end_time | The end time of the certificate validity period |
| cert_request_pem | The CSR in PEM format |
