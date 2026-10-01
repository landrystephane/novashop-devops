variable "ami_id" {
  description = "ID de l'AMI Ubuntu dans la région ca-central-1"
  type        = string
}

variable "key_name" {
  description = "Nom de la paire de clés SSH créée dans AWS"
  type        = string
}