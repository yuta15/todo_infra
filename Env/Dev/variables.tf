

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


variable "repo_url" {
    description = "リポジトリのURLを入力"
    type = string
}


variable "container_cpu_count" {
    description = "containerのCPU数"
  
}