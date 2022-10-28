#!/bin/bash
# PROFILE=${1:-$AWS_PROFILE}
# ACCOUNT_ID=$(aws configure get --profile $PROFILE sso_account_id)
# ROLE_NAME=$(aws configure get --profile $PROFILE sso_role_name)
# ACCESS_TOKEN_FILE=$(find ~/.aws/sso/cache/* ! -name '*client*')
# AWS_REGION=$(aws configure get --profile $PROFILE region)
# CREDENTIALS=$(aws sso get-role-credentials --role-name $ROLE_NAME --account-id $ACCOUNT_ID --region $AWS_REGION --access-token $(jq -r .accessToken $ACCESS_TOKEN_FILE))

# echo "setting aws credentials for profile:${PROFILE}"
# export AWS_ACCESS_KEY_ID=$(echo $CREDENTIALS | jq -r .roleCredentials.accessKeyId)
# export AWS_SECRET_ACCESS_KEY=$(echo $CREDENTIALS | jq -r .roleCredentials.secretAccessKey)
# export AWS_SESSION_TOKEN=$(echo $CREDENTIALS | jq -r .roleCredentials.sessionToken)
# export AWS_REGION=$AWS_REGION

# echo "aws region: $AWS_REGION"


#### ROLE_ARN should be set in .zshrc file
echo "setting aws credentials for role_arn:$ROLE_ARN"
AWS_REGION='us-east-1'
OUT=$(aws sts assume-role --role-arn $ROLE_ARN --role-session-name test_session)
export AWS_ACCESS_KEY_ID=$(echo $OUT | jq -r '.Credentials''.AccessKeyId')
export AWS_SECRET_ACCESS_KEY=$(echo $OUT | jq -r '.Credentials''.SecretAccessKey')
export AWS_SESSION_TOKEN=$(echo $OUT | jq -r '.Credentials''.SessionToken')
export AWS_REGION=$AWS_REGION

echo "aws region: $AWS_REGION"