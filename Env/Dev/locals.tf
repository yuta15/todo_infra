locals {
    region = "ap-northeast-1"
    az = formatlist("${local.region}%s", ["a", "c"])
    default_tags = {
        Env = "Dev"
        terraform = "true"
    }
    public_subnet_role = "alb"
    nacl_data = [
        {
            role = "alb",
            ingress = [
                [100, "tcp", "0.0.0.0/0", 80, 80, "allow"],
                [110, "tcp", "0.0.0.0/0", 443, 443, "allow"],
            ],
            egress = [
                [100, -1, "0.0.0.0/0", 0, 0, "allow"]
            ]
        },
        {
            role = "todo",
            ingress = [
                [100, "tcp", "172.18.0.0/16", 80, 80, "allow"],
                [110, "tcp", "172.18.0.0/16", 443, 443, "allow"],
            ],
            egress = [
                [100, -1, "0.0.0.0/0", 0, 0, "allow"]
            ]
        },
        {
            role = "backend",
            ingress = [
                [100, -1, "172.18.0.0/16", 0, 0, "allow"],
            ],
            egress = [
                [100, -1, "0.0.0.0/0", 0, 0, "allow"]
            ]
        },
    ]
}