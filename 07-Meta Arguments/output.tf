
output "s3_bucket_names_count" {
  description = "Names of S3 buckets created with count (using splat expression)"
  value       = aws_s3_bucket.example_count[*].id
}


output "s3_bucket_arns_count" {
  description = "ARNs of S3 buckets created with count"
  value       = aws_s3_bucket.example_count[*].arn
}

output "s3_bucket_names_foreach" {
  description = "Names of S3 buckets created with for_each (using for loop)"
  value       = [for bucket in aws_s3_bucket.example_foreach : bucket.id]
}

output "s3_bucket_details_foreach" {
  description = "Map of bucket names to ARNs from for_each"
  value = {
    for key, bucket in aws_s3_bucket.example_foreach :
    key => {
      id  = bucket.id
      arn = bucket.arn
    }
  }
}

output "primary_bucket_id" {
  description = "Primary bucket ID (for depends_on example)"
  value       = aws_s3_bucket.primary.id
}

output "dependent_bucket_id" {
  description = "Dependent bucket ID (created after primary)"
  value       = aws_s3_bucket.dependent.id
}

output "lifecycle_bucket_id" {
  description = "Lifecycle example bucket ID"
  value       = aws_s3_bucket.lifecycle_example.id
}

output "total_s3_buckets_created" {
  description = "Total number of S3 buckets created"
  value       = length(var.s3_bucket_names) + length(var.s3_bucket_set) + 3 # +3 for primary, dependent, lifecycle
}

output "all_bucket_names" {
  description = "All S3 bucket names created (count + for_each)"
  value = concat(
    aws_s3_bucket.example_count[*].id,
    [for bucket in aws_s3_bucket.example_foreach : bucket.id]
  )
}

