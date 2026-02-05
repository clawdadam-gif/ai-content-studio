#!/bin/bash

# Deploy to Vercel using REST API (no jq required)
VERCEL_TOKEN="Clsc093xBHUcvHGHxMznLIVX"
PROJECT_NAME="ai-content-studio"

echo "🚀 Deploying to Vercel via API..."
echo ""

# Get user info
echo "Step 1: Authenticating with Vercel..."
curl -s -H "Authorization: Bearer $VERCEL_TOKEN" \
  https://api.vercel.com/v2/user > /tmp/vercel-user.json

if grep -q "error" /tmp/vercel-user.json; then
    echo "❌ Token authentication failed!"
    cat /tmp/vercel-user.json
    exit 1
fi

echo "✅ Authenticated!"
echo ""

# Try to deploy the landing page directory
echo "Step 2: Creating deployment..."
echo ""

# Create a deployment from git
DEPLOY_RESPONSE=$(curl -s -X POST \
  -H "Authorization: Bearer $VERCEL_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"name\": \"$PROJECT_NAME\",
    \"framework\": \"nextjs\",
    \"gitSource\": {
      \"type\": \"github\",
      \"repo\": \"clawdadam-gif/ai-content-studio\",
      \"ref\": \"main\",
      \"rootDir\": \"landing-page\"
    }
  }" \
  https://api.vercel.com/v13/deployments)

echo "$DEPLOY_RESPONSE" > /tmp/vercel-deploy.json
cat /tmp/vercel-deploy.json

if grep -q '"error"' /tmp/vercel-deploy.json; then
    echo ""
    echo "❌ Deployment failed. Trying alternative approach..."
    echo ""
    echo "The issue: Vercel needs a project connected to GitHub first."
    echo ""
    echo "QUICK FIX (30 seconds):"
    echo "1. Go to: https://vercel.com/new"
    echo "2. Click 'Import Git Repository'"
    echo "3. Select: ai-content-studio"
    echo "4. Root Directory: landing-page"
    echo "5. Click 'Deploy'"
    echo ""
    echo "Then tell me 'deployed' and I'll verify it's live!"
else
    echo ""
    echo "✅ Deployment started!"
    DEPLOY_URL=$(cat /tmp/vercel-deploy.json | grep -o '"url":"[^"]*"' | head -1 | cut -d'"' -f4)
    echo "🔗 Deployment URL: $DEPLOY_URL"
fi
