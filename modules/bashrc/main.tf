variable "home" {
    type = string
    description = "home directory location"
}

resource "local_file" "bashrc" {
    filename = "${var.home}/.bashrc"
    file_permission = "0774"
    content = file("${path.module}/bashrc")
}