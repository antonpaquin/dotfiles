variable "home" {
    type = string
    description = "home directory location"
}

resource "local_file" "sway" {
    filename = "${var.home}/.config/sway/config"
    content = file("${path.module}/sway.conf")
}

resource "local_file" "swayctx_script" {
    filename = "${var.home}/scripts/sway-context"
    content = file("${path.module}/sway-context")
    file_permission = "0770"
}