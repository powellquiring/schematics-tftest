locals {
  param = "4"
}
resource "null_resource" "script" {
  triggers = {
    path_module = path.module
    param       = local.param
    prefix      = var.prefix
  }
  provisioner "local-exec" {
    command = <<-EOS
      PARAM=${self.triggers.param} \
      PREFIX=${self.triggers.prefix} \
      ${self.triggers.path_module}/bin/script.sh create
    EOS
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<-EOS
      PARAM=${self.triggers.param} \
      PREFIX=${self.triggers.prefix} \
      ${self.triggers.path_module}/bin/script.sh destroy
    EOS
  }
}
