variable "home" {
    type = string
    description = "home directory location"
}

variable "entries" {
    type = list(object({
        name: string
        icon: string
        cmd: string
    }))

    default = [ 
        {
            name: "alacritty",
            icon: "alacritty",
            cmd: null
        },
        {
            name: "audacity",
            icon: "audacity",
            cmd: null
        },
        {
            name: "calc",
            icon: "libreoffice-calc",
            cmd: "libreoffice --calc"
        },
        {
            name: "deluge",
            icon: "deluge",
            cmd: null
        },
        {
            name: "firefox",
            icon: "firefox",
            cmd: null
        },
        {
            name: "freecad",
            icon: "freecad",
            cmd: null
        },
        {
            name: "gimp",
            icon: "gimp",
            cmd: null
        },
        {
            name: "htop",
            icon: "htop",
            cmd: "alacritty -e htop"
        },
        {
            name: "kicad",
            icon: "kicad",
            cmd: null
        },
        {
            name: "spotify",
            icon: "spotify",
            cmd: "alacritty -e ncspot"
        },
        {
            name: "volume",
            icon: "mixer",
            cmd: "pavucontrol"
        },
        {
            name: "vscode",
            icon: "vscode",
            cmd: "code"
        },
        {
            name: "writer",
            icon: "libreoffice-writer",
            cmd: "libreoffice --writer"
        },
    ]
}

locals {
    char00 = base64decode("AA==")
    char1f = base64decode("Hw==")
}

resource "local_file" "menu" {
    filename = "${var.home}/.opt/rofi/menu"
    content = join("\n", [
        for entry in var.entries:
        join("", [entry.name, local.char00, "icon", local.char1f, entry.icon])
    ])
}

resource "local_file" "rofi_sh" {
    filename = "${var.home}/.opt/rofi/rofi.sh"
    content = file("${path.module}/rofi.sh")
    file_permission = "0770"
}

resource "local_file" "rofi_cmd_sh" {
    for_each = {for entry in var.entries: entry.name => entry if entry.cmd != null}
    filename = "${var.home}/.opt/rofi/bin/${each.value.name}"
    content = <<EOF
#! /bin/bash

${each.value.cmd}
EOF
    file_permission = "0770"
}

resource "local_file" "rofi" {
    filename = "${var.home}/.config/rofi/config.rasi"
    content = file("${path.module}/config.rasi")
}

resource "local_file" "rofi_swayctx_sh" {
    filename = "${var.home}/.opt/rofi/rofi-sway-context.sh"
    content = file("${path.module}/rofi-sway-context.sh")
    file_permission = "0770"
}

resource "local_file" "rofi_swayctx_cfg" {
    filename = "${var.home}/.config/rofi/sway-context-config.rasi"
    content = file("${path.module}/sway-context-config.rasi")
}
