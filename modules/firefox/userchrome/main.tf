variable "home" {
    type = string
    description = "home directory location"
}

variable "profile_id" {
    type = string
    description = "Firefox profile ID (just the random bit)"
}

resource "local_file" "userchrome" {
    filename = "${var.home}/.mozilla/firefox/${var.profile_id}.default-release/chrome/userChrome.css"
    content = file("${path.module}/userChrome.css")

}