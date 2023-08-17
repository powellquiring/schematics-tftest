locals {
  param   = "2"
  desktop = var.SCHEMATICSLOCATION == "" ? true : false
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "null_resource" "script" {
  triggers = {
    path_module        = path.module
    param              = local.param
    prefix             = var.prefix
    SCHEMATICSLOCATION = var.SCHEMATICSLOCATION
    desktop            = local.desktop
  }
  provisioner "local-exec" {
    command = <<-EOS
      PARAM=${self.triggers.param} \
      PREFIX=${self.triggers.prefix} \
      SCHEMATICSLOCATION=${self.triggers.SCHEMATICSLOCATION} \
      DESKTOP=${self.triggers.desktop} \
      ${self.triggers.path_module}/bin/script.sh create
    EOS
  }
  provisioner "local-exec" {
    when    = destroy
    command = <<-EOS
      PARAM=${self.triggers.param} \
      PREFIX=${self.triggers.prefix} \
      SCHEMATICSLOCATION=${self.triggers.SCHEMATICSLOCATION} \
      DESKTOP=${self.triggers.desktop} \
      ${self.triggers.path_module}/bin/script.sh destroy
    EOS
  }
}

