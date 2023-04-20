variable "home" {
    type = string
    description = "home directory location"
}

resource "local_file" "change_script" {
    filename = "${var.home}/.opt/background/set_background.sh"
    content = file("${path.module}/set_background.sh")
}

resource "local_file" "change_cron" {
    filename = "${var.home}/.opt/cron/m5.d/rotate_background.sh"
    content = <<EOF
#! /bin/bash
${local_file.change_script.filename}
EOF
    file_permission = "744"
}
