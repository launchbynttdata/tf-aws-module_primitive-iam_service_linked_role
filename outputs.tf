// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

# ============================================
# IAM SERVICE LINKED ROLE PRIMITIVE OUTPUTS
# ============================================

output "id" {
  description = "The Amazon Resource Name (ARN) of the role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].id : aws_iam_service_linked_role.this[0].id
}

output "arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].arn : aws_iam_service_linked_role.this[0].arn
}

output "create_date" {
  description = "The creation date of the IAM role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].create_date : aws_iam_service_linked_role.this[0].create_date
}

output "name" {
  description = "The name of the role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].name : aws_iam_service_linked_role.this[0].name
}

output "path" {
  description = "The path of the role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].path : aws_iam_service_linked_role.this[0].path
}

output "unique_id" {
  description = "The stable and unique string identifying the role."
  value       = local.role_exists ? data.aws_iam_role.existing[0].unique_id : aws_iam_service_linked_role.this[0].unique_id
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = local.role_exists ? data.aws_iam_role.existing[0].tags : aws_iam_service_linked_role.this[0].tags_all
}

output "role_exists" {
  description = "Whether the role already existed or was created by this module."
  value       = local.role_exists
}
