variable "rg_name" {
  type = string
  default = "serviceapp-rg"
}

variable "st_ac_name" {
  type    = string
  default = "tfstate1048584424"
}

variable "container_name" {
  type    = string
  default = "tfstate"
}

variable "key" {
  type    = string
  default = "terraform.tfstate"
}
