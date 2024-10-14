resource "aws_ecs_task_definition" "this" {
    depends_on = [ aws_iam_role.this ]
    for_each = {for task in var.tasks: task.name => task}
    family = each.key
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = each.value.cpu_count
    memory = each.value.memory
    task_role_arn = aws_iam_role.this.arn
    execution_role_arn = aws_iam_role.this.arn
    container_definitions = jsonencode([
        {
            name = "todo"
            image = var.task_data.repo_url
            essential = true
            portMappings = var.task_data.port_mapping
        }
    ])
}