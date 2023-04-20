variable "home" {
    type = string
    description = "home directory location"
}

locals {
    _media_icons = toset([
        "alacritty",
        "gimp",
        "mixer",
        "spotify",
        "vscode",
    ])
}

data "http" "media_icon" {
    for_each = local._media_icons
    url = "http://media-srv.antonpaqu.in/tech/icons/${each.key}.svg"
    method = "GET"
}

resource "local_file" "media_icon" {
    for_each = local._media_icons
    filename = "${var.home}/.local/share/icons/${each.key}.svg"
    content = data.http.media_icon[each.key].response_body
}