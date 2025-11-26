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

package testimpl

import (
	"context"
	"testing"

	"github.com/aws/aws-sdk-go-v2/aws"
	"github.com/aws/aws-sdk-go-v2/config"
	"github.com/aws/aws-sdk-go-v2/service/iam"
	"github.com/gruntwork-io/terratest/modules/terraform"
	lcafTypes "github.com/launchbynttdata/lcaf-component-terratest/types"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

const (
	failedToGetRoleMsg     = "Failed to get IAM role"
	failedToGetRoleTagsMsg = "Failed to list IAM role tags"
)

func TestComposableComplete(t *testing.T, ctx lcafTypes.TestContext) {
	iamClient := GetAWSIAMClient(t)

	roleArn := terraform.Output(t, ctx.TerratestTerraformOptions(), "role_arn")
	roleName := terraform.Output(t, ctx.TerratestTerraformOptions(), "role_name")
	roleId := terraform.Output(t, ctx.TerratestTerraformOptions(), "role_id")
	roleExistsStr := terraform.Output(t, ctx.TerratestTerraformOptions(), "role_exists")
	roleExists := roleExistsStr == "true"

	t.Run("TestIAMServiceLinkedRoleExists", func(t *testing.T) {
		testIAMServiceLinkedRoleExists(t, iamClient, roleArn, roleName, roleId)
	})

	t.Run("TestIAMServiceLinkedRoleProperties", func(t *testing.T) {
		testIAMServiceLinkedRoleProperties(t, iamClient, roleArn, roleName)
	})

	if !roleExists {
		t.Run("TestIAMServiceLinkedRoleTags", func(t *testing.T) {
			var roleTags map[string]interface{}
			terraform.OutputStruct(t, ctx.TerratestTerraformOptions(), "role_tags_all", &roleTags)
			testIAMServiceLinkedRoleTags(t, iamClient, roleName, roleTags)
		})
	}
}

func testIAMServiceLinkedRoleExists(t *testing.T, iamClient *iam.Client, roleArn, roleName, roleId string) {
	roleOutput, err := iamClient.GetRole(context.TODO(), &iam.GetRoleInput{
		RoleName: aws.String(roleName),
	})
	require.NoError(t, err, failedToGetRoleMsg)
	require.NotNil(t, roleOutput.Role, "Role should not be nil")
	assert.Equal(t, roleArn, *roleOutput.Role.Arn, "Expected role ARN did not match actual ARN!")
	assert.Equal(t, roleName, *roleOutput.Role.RoleName, "Expected role name did not match actual name!")
	assert.Equal(t, roleId, *roleOutput.Role.RoleName, "Expected role name did not match actual name!")
}

func testIAMServiceLinkedRoleProperties(t *testing.T, iamClient *iam.Client, roleArn, roleName string) {
	role, err := iamClient.GetRole(context.TODO(), &iam.GetRoleInput{
		RoleName: aws.String(roleName),
	})
	require.NoError(t, err, failedToGetRoleMsg)
	require.NotNil(t, role.Role, "Role should not be nil")

	r := role.Role

	// Verify role name and ARN
	assert.Equal(t, roleName, *r.RoleName, "Role name should match expected value")
	assert.Equal(t, roleArn, *r.Arn, "Role ARN should match expected value")

	// Verify role path (service-linked roles have specific paths)
	assert.Equal(t, "/aws-service-role/ecs.amazonaws.com/", *r.Path, "Role path should be /aws-service-role/ecs.amazonaws.com/ for service-linked roles")

	// Verify create date
	assert.NotNil(t, r.CreateDate, "Role should have a create date")

	// Verify role is service-linked (has specific path)
	assert.Equal(t, "/aws-service-role/ecs.amazonaws.com/", *r.Path, "Role should be a service-linked role with path /aws-service-role/ecs.amazonaws.com/")
}

func testIAMServiceLinkedRoleTags(t *testing.T, iamClient *iam.Client, roleName string, expectedTags map[string]interface{}) {
	if len(expectedTags) == 0 {
		return
	}

	// Get role tags
	roleTagsOutput, err := iamClient.ListRoleTags(context.TODO(), &iam.ListRoleTagsInput{
		RoleName: aws.String(roleName),
	})
	require.NoError(t, err, failedToGetRoleTagsMsg)

	// Convert AWS tags to map for comparison
	actualTags := make(map[string]string)
	for _, tag := range roleTagsOutput.Tags {
		actualTags[*tag.Key] = *tag.Value
	}

	// Verify expected tags exist
	for key, value := range expectedTags {
		if valueStr, ok := value.(string); ok {
			assert.Equal(t, valueStr, actualTags[key], "Tag %s should have expected value", key)
		}
	}
}

func GetAWSIAMClient(t *testing.T) *iam.Client {
	awsIAMClient := iam.NewFromConfig(GetAWSConfig(t))
	return awsIAMClient
}

func GetAWSConfig(t *testing.T) (cfg aws.Config) {
	cfg, err := config.LoadDefaultConfig(context.TODO())
	require.NoErrorf(t, err, "unable to load SDK config, %v", err)
	return cfg
}
