data "aws_subnets" "this" {
    filter {
        name = "tag:Name"
        values = ["todo*"]
    }
}


resource "aws_ecs_service" "this" {
    depends_on = [ aws_iam_role.this ]
    name = "todo"
    cluster = aws_ecs_cluster.this.id
    task_definition = aws_ecs_task_definition.this.arn
    desired_count = var.task_data.desired_count

    launch_type = "FARGATE"

    network_configuration {
        subnets = data.aws_subnets.this.ids
    }
}