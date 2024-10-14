variable "tasks" {
    description = "コンテナを作成するためのタスクをリスト形式で定義"
    type = list(object({
        name = string,
        service = string,
        
    }))
}


