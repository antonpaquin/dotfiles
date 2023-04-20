variable "home" {
    type = string
    description = "home directory location"
}

resource "local_file" "waybar_config" {
    filename = "${var.home}/.config/waybar/config"
    file_permission = "0660"
    content = file("${path.module}/config")
}

resource "local_file" "waybar_sh" {
    filename = "${var.home}/.opt/waybar/waybar.sh"
    file_permission = "0744"
    content = file("${path.module}/waybar.sh")
}