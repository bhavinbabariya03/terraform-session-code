variable "ENVIRONMENT" {
  default = "staging"
}

resource "aws_dynamodb_table" "bulk_operation_history_table" {
  name           = "bulk-operation-service-history-${var.ENVIRONMENT}"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 2
  hash_key       = "id"

  attribute {
    name = "id"
    type = "S"
  }

  attribute {
    name = "executionId"
    type = "S"
  }

  attribute {
    name = "initialKey"
    type = "N"
  }

  attribute {
    name = "createAt"
    type = "N"
  }

  global_secondary_index {
    name            = "ExecutionIdIndex"
    hash_key        = "executionId"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 2
  }

  global_secondary_index {
    name            = "SortByCreatedAtIndex"
    hash_key        = "initialKey"
    range_key       = "createAt"
    projection_type = "ALL"
    read_capacity   = 5
    write_capacity  = 2
  }

  tags = {
    Name        = "bulk-operation-service-history-${var.ENVIRONMENT}"
    Environment = "${var.ENVIRONMENT}"
    STAGE       = "${var.ENVIRONMENT}"
    Owner       = "BST_TEAM"
  }
}