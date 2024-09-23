variable "vpc_cidr" {
    description = "VPCのCIDR情報"
    type = string
}

variable "vpc_name" {
    description = "VPCの名前"
    type = string
}

variable "az" {
    description = "サブネットを配置するAZのリスト"
    type = list(string)
}

variable "subnet_roles" {
    description = "サブネットの役割リスト"
    type = list(string)
}

variable "public_subnet_role" {
    description = "publicサブネットとなるサブネットロールを指定.パブリックサブネットにできるのは一つのroleのみ"
    type = string
  
}

variable "nacl_data" {
    description = "naclを適用するロール、ingress/egressルールを記述"
    # [rule_no, protocol, cidr_block, from_port, to_port, action]
    type = list(object({
      role = string,
      ingress = list(any),
      egress = list(any)
    }))
}