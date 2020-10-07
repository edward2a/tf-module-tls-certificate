terraform {
    required_version    =   "~> 0.12.28"
    experiments         =   [variable_validation]
}

provider tls {
    version             =   "~> 2.2.0"
}