# Deliberately kept insecure in that it only uses HTTP Basic Auth. 
# We should fix this eventually, but good enough for testing for now.
provider "kubectl" {
  apply_retry_count = 3
  load_config_file = "false"

  host = "https://${google_container_cluster.primary.endpoint}"
  insecure = true
  username = "admin"
  password = var.password
}

data "kubectl_file_documents" "manifests" {
    content = file(var.bookinfo_apps_path)
}

resource "null_resource" "add_configmap" {
  provisioner "local-exec" {
    command = var.add_configmap
    interpreter = ["/bin/bash", "-c"]
  }
}

resource "kubectl_manifest" "bookinfo" {
    for_each = toset(data.kubectl_file_documents.manifests.documents)
    yaml_body = each.value
}