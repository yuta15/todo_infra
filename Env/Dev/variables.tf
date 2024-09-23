

variable "vpc_cidr" {
    description = "VPCのCIDR情報"
    type = string
}


variable "vpc_name" {
    description = "VPCの名前"
    type = string
}


variable "subnet_roles" {
    description = "サブネットの役割一覧.最大で8個作成可能"
    type = list(string)
}