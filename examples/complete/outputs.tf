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

output "role_id" {
  description = "The Amazon Resource Name (ARN) of the role."
  value       = module.iam_service_linked_role.id
}

output "role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the role."
  value       = module.iam_service_linked_role.arn
}

output "role_create_date" {
  description = "The creation date of the IAM role."
  value       = module.iam_service_linked_role.create_date
}

output "role_name" {
  description = "The name of the role."
  value       = module.iam_service_linked_role.name
}

output "role_path" {
  description = "The path of the role."
  value       = module.iam_service_linked_role.path
}

output "role_unique_id" {
  description = "The stable and unique string identifying the role."
  value       = module.iam_service_linked_role.unique_id
}

output "role_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = module.iam_service_linked_role.tags_all
}

output "role_exists" {
  description = "Whether the role already existed or was created by this module."
  value       = module.iam_service_linked_role.role_exists
}
