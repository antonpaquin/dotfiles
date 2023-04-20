locals {
    script_dir = "/root/scripts/update-hosts"

    _hakurei_hosts = [
        "alertmanager-prometheus.antonpaqu.in",
        "api.deluge.antonpaqu.in",
        "authproxy.antonpaqu.in",
        "blog.antonpaqu.in",
        "deluge.antonpaqu.in",
        "devpi.antonpaqu.in",
        "distributed-diffusion.antonpaqu.in",
        "filebrowser.antonpaqu.in",
        "grafana.antonpaqu.in",
        "grocy.antonpaqu.in",
        "hardlinker.antonpaqu.in",
        "heimdall.antonpaqu.in",
        "jellyfin.antonpaqu.in",
        "keycloak.antonpaqu.in",
        "komga.antonpaqu.in",
        "logserv.antonpaqu.in",
        "matrix-element.antonpaqu.in",
        "matrix-synapse.antonpaqu.in",
        "media-srv.antonpaqu.in",
        "metube.antonpaqu.in",
        "photoprism.antonpaqu.in",
        "prometheus.antonpaqu.in",
        "pushgateway-prometheus.antonpaqu.in",
        "sonarr.antonpaqu.in",
        "stable-diffusion.antonpaqu.in",
        "tandoor.antonpaqu.in",
    ]

    ssid_entries = {
        "PS50-a5": {
            for host in local._hakurei_hosts:
            host => "10.0.3.20"
        }
        "PS50-a": {
            for host in local._hakurei_hosts:
            host => "10.0.3.20"
        }
        "Kattegat": {
            for host in local._hakurei_hosts:
            host => "192.168.0.105"
        }
    }
}

resource "local_file" "update_script" {
    content = file("${path.module}/update-hosts.sh")
    filename = "${local.script_dir}/update-hosts.sh"
    file_permission = "0700"
}

resource "local_file" "dispatcher" {
    content = file("${path.module}/dispatcher.sh")
    filename = "/etc/NetworkManager/dispatcher.d/update-hosts.sh"
    file_permission = "0700"
}

resource "local_file" "hosts_base" {
    content = file("${path.module}/base.hosts")
    filename = "/${local.script_dir}/base.hosts"
    file_permission = "0440"
}

resource "local_file" "hosts_file" {
    for_each = local.ssid_entries
    content = join("\n", concat([
        for k, v in each.value: 
        "${v} ${k}"
    ], [""]))
    filename = "/${local.script_dir}/${each.key}.hosts"
    file_permission = "0440"
}
