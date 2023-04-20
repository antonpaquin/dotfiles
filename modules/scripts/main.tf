variable "home" {
    type = string
}

locals {
    scripts = [
        "firefox-sway",
        "codium-product-fix",
    ]
}

resource "local_file" "script" {
    for_each = toset(local.scripts)
    filename = "${var.home}/scripts/${each.key}"
    content = file("${path.module}/${each.key}")
    file_permission = "0774"
}

resource "local_file" "firefox-sway-backup" {
    filename = "${var.home}/.opt/cron/m5.d/firefox-sway-backup.sh"
    content = file("${path.module}/firefox-sway-cron.sh")
    file_permission = "0744"
}
