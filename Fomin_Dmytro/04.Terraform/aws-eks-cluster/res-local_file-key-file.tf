# Resource: local_file
#
# Generates a local file with the given content.
# When working with local files, Terraform will detect the resource as having been deleted each 
# time a configuration is applied on a new machine where the file is not present and will generate 
# a diff to re-create it. This may cause "noise" in diffs in environments where configurations 
# are routinely applied by many different users or within automation systems.
#
# https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file

//Saving Private Key PEM File
resource "local_file" "key-file" {
  content_base64 = tls_private_key.tls_key.private_key_pem
  filename       = "eks-key.pem"

  depends_on = [
    tls_private_key.tls_key
  ]
}
