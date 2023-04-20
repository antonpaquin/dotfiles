terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "~> 2.2.3"
        }
        http = {
            source = "hashicorp/http"
            version = "3.2.1"
        }
    }
}

locals {
}

module "hosts" {
    source = "../../../modules/networkManager/hosts"
}
