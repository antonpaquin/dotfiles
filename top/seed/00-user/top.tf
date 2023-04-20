terraform {
    required_providers {
        local = {
            source = "hashicorp/local"
            version = "~> 2.2.3"
        }
    }
}

locals {
    home = "/home/anton"
    firefox_profile_id = "pspus3d6"
}

module "alacritty" {
    source = "../../../modules/alacritty"
    home = local.home
}

module "background" {
    source = "../../../modules/background"
    home = local.home
}

module "bashrc" {
    source = "../../../modules/bashrc"
    home = local.home
}

module "cron" {
    source = "../../../modules/cron"
    home = local.home
}

module "firefoxUserChrome" {
    source = "../../../modules/firefox/userchrome"
    home = local.home
    profile_id = local.firefox_profile_id
}

# module "icons" {
#     source = "../../../modules/icons"
#     home = local.home
# }

module "rofi" {
    source = "../../../modules/rofi"
    home = local.home
}

module "scripts" {
    source = "../../../modules/scripts"
    home = local.home
}

module "ssh" {
    source = "../../../modules/ssh"
    home = local.home
}

module "sway" {
    source = "../../../modules/sway"
    home = local.home
}

module "waybar" {
    source = "../../../modules/waybar"
    home = local.home
}