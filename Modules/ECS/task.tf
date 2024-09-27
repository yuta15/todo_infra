resource "aws_ecs_task_definition" "this" {
    family = "todo"
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = 1024
    memory = 2048
    container_definitions = file("./container_definitions.json")
  
}