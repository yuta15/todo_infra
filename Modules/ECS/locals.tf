locals {
    tasks = {for service in var.tasks: service => }
}