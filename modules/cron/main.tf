variable "home" {
    type = string
    description = "home directory location"
}

locals {
  _cron_scripts = {
    "m5": "*/5 * * * *",
    "hourly": "0 * * * *",
  }
}

resource "local_file" "cron_script" {
    filename = "${var.home}/.opt/cron/trigger.sh"
    content = file("${path.module}/trigger.sh")
}

resource "local_file" "crontab" {
    filename = "/var/spool/cron/anton"
    content = join("\n", concat([
        for k, v in local._cron_scripts:
        "${v} \"${local_file.cron_script.filename}\" ${k}"
    ], [""]))
}
