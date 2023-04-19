# Creating Null Resource for Local Provisioner
resource "null_resource" "ansible_local_provisioner" {
 depends_on = [
    azurerm_virtual_machine_data_disk_attachment.data_disk_attachment
  ]

  provisioner "local-exec" {
    command = "ansible-playbook ~/automation/ansible/ansible/groupX-playbook.yaml"
  }

}