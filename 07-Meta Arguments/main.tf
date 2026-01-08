

resource "aws_s3_bucket" "example_count" {
  count = length(var.s3_bucket_names)

  bucket = var.s3_bucket_names[count.index]

  tags = {
    Name        = var.s3_bucket_names[count.index]
    Environment = var.environment
    Index       = count.index
    ManagedBy   = "terraform"
  }
}


resource "aws_s3_bucket" "example_foreach" {
  for_each = var.s3_bucket_set

  bucket = each.value

  tags = {
    Name        = each.value
    Environment = var.environment
    BucketType  = "foreach-example"
    ManagedBy   = "terraform"
  }
}

resource "aws_s3_bucket" "primary" {
  bucket = "tf-day08-primary-${var.environment}-20251017"

  tags = {
    Name        = "Primary Bucket"
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}


resource "aws_s3_bucket" "dependent" {
  bucket = "tf-day08-dependent-${var.environment}-20251017"

  depends_on = [aws_s3_bucket.primary]

  tags = {
    Name        = "Dependent Bucket"
    Environment = var.environment
    DependsOn   = "primary-bucket"
    ManagedBy   = "terraform"
  }
}


resource "aws_s3_bucket" "lifecycle_example" {
  bucket = "tf-day08-lifecycle-${var.environment}-20251017"

  lifecycle {
    prevent_destroy = false 
    create_before_destroy = true
    ignore_changes = [
      tags["CreatedDate"],
    ]
  }

  tags = {
    Name        = "Lifecycle Example"
    Environment = var.environment
    ManagedBy   = "terraform"
    CreatedDate = "2025-10-17"
  }
}


