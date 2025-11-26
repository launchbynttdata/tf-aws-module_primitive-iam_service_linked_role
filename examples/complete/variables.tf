
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

variable "aws_service_name" {
  description = "The AWS service to which this role is attached. You use a string similar to a URL but without the http:// in front. For example: elasticbeanstalk.amazonaws.com."
  type        = string
}

variable "custom_suffix" {
  description = "Additional string appended to the role name. Not all AWS services support custom suffixes."
  type        = string
  default     = null
}

variable "description" {
  description = "The description of the role."
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value mapping of tags for the IAM role."
  type        = map(string)
  default     = {}
}
