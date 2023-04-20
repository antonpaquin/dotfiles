variable "home" {
    type = string
    description = "home directory location"
}

resource "local_file" "alacritty" {
    filename = "${var.home}/.config/alacritty/alacritty.yml"
    file_permission = "0664"
    content = file("${path.module}/alacritty.yml")
}