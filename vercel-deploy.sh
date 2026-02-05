#!/bin/bash

# Deploy to Vercel using REST API
VERCEL_TOKEN="Clsc093xBHUcvHGHxMznLIVX"
VERCEL_ORG_ID=""  # Will get from first API call
PROJECT_NAME="ai-content-studio"

echo "🚀 Deploying to Vercel via API..."
echo ""

# Get user info and org ID
echo "Step 1: Getting user info..."
USER_INFO=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" \
  https://api.vercel.com/v2/user)

echo "$USER_INFO" | jq '.'

# Get user ID
USER_ID=$(echo "$USER_INFO" | jq -r '.id')
echo "✅ User ID: $USER_ID"
echo ""

# List existing projects
echo "Step 2: Checking for existing projects..."
PROJECTS=$(curl -s -H "Authorization: Bearer $VERCEL_TOKEN" \
  "https://api.vercel.com/v9/projects?teamId=$USER_ID")

echo "$PROJECTS" | jq '.[]'

# Check if project exists
EXISTING_PROJECT=$(echo "$PROJECTS" | jq -r ".[] | select(.name==\"$PROJECT_NAME\") | .id")

if [ -n "$EXISTING_PROJECT" ]; then
    echo "✅ Project exists: $EXISTING_PROJECT"
else
    echo "ℹ️  Project doesn't exist, need to create it"
fi

echo ""
echo "Next: Need to create deployment or link to GitHub repo"
