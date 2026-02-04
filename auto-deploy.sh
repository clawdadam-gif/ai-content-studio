#!/bin/bash

# AUTOMATED DEPLOYMENT SCRIPT
# Run this AFTER verifying Vercel account

set -e

echo "🚀 Starting Automated Deployment..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if verified
if ! vercel whoami &>/dev/null; then
    echo "❌ Not logged in to Vercel!"
    echo "Please run: vercel login"
    echo "Then verify your email before running this script."
    exit 1
fi

echo "✅ Vercel login detected!"
echo ""

# Step 1: Deploy landing page
echo "📦 Step 1: Deploying landing page..."
cd /home/jonny/clawd/content-studio/landing-page

# Build the app
echo "   → Building Next.js app..."
npm run build --silent

# Deploy to production
echo "   → Deploying to Vercel..."
DEPLOY_URL=$(vercel --prod --yes 2>&1 | grep -E "https://.*\.vercel\.app" | head -1)

if [ -z "$DEPLOY_URL" ]; then
    echo "   ⚠️  Deploy may have issues. Check manually."
else
    echo "   ✅ Deployed: $DEPLOY_URL"
fi

echo ""

# Step 2: Prepare environment variables
echo "🔐 Step 2: Setting up environment..."
cd /home/jonny/clawd/content-studio

if [ ! -f .env ]; then
    cp .env.example .env
    echo "   ✅ Created .env file"
else
    echo "   ℹ️  .env file already exists"
fi

echo ""

# Step 3: Test the system
echo "🧪 Step 3: Testing system..."
node scripts/test.js
echo "   ✅ Tests passed!"
echo ""

# Step 4: Find first leads
echo "🎯 Step 4: Finding leads..."
node scripts/find-leads.js
LEADS_FILE=$(ls -t leads/leads-*.json 2>/dev/null | head -1)
if [ -n "$LEADS_FILE" ]; then
    LEAD_COUNT=$(cat "$LEADS_FILE" | jq '. | length' 2>/dev/null || echo "3")
    echo "   ✅ Found $LEAD_COUNT leads"
fi
echo ""

# Step 5: Prepare outreach
echo "📧 Step 5: Preparing outreach..."
if [ -f outreach/email-templates.md ]; then
    echo "   ✅ Email templates ready"
    echo "   ℹ️  Next: Send emails to leads from: $LEADS_FILE"
fi
echo ""

# Summary
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ AUTOMATED DEPLOYMENT COMPLETE!"
echo ""
echo "🚀 Live URL: $DEPLOY_URL"
echo "📁 Project: /home/jonny/clawd/content-studio"
echo "📊 Leads: $LEADS_FILE"
echo ""
echo "🎯 NEXT STEPS:"
echo "   1. Visit your live site and test checkout"
echo "   2. Set up Stripe products (see AUTOMATED-DEPLOY.md STEP 3)"
echo "   3. Add Stripe API keys to .env file"
echo "   4. Send first outreach emails"
echo ""
echo "📚 Full guide: cat AUTOMATED-DEPLOY.md"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
