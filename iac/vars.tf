variable "env_id" {
    type=string
    description = "enviroment id"
    default ="dev"
}

variable "location" {
    type = string
    description = "Server Location"
    default = "East Us"
}

variable "src" {
    type = string
    description = "Infraestructure source"
    default = "terraform"
}

variable "subscription_id" {
    type = string
    description = "Azure subscription id"
    default = "f292716c-b2a3-458b-a683-a64fdea52893"
}
