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
# LOCAL VALUES AND COMPUTED EXPRESSIONS
# ============================================

locals {
  service_part       = replace(var.aws_service_name, ".amazonaws.com", "")
  service_id         = length(local.service_part) <= 4 ? upper(local.service_part) : replace(title(replace(local.service_part, "-", " ")), " ", "")
  expected_role_name = var.custom_suffix != null ? "AWSServiceRoleFor${local.service_id}-${var.custom_suffix}" : "AWSServiceRoleFor${local.service_id}"
  role_exists        = contains(data.aws_iam_roles.all.names, local.expected_role_name)
}
