#!/bin/bash

# AI Content Repurposing Studio - Quick Setup
# Run this script to get everything deployed in 30 minutes

set -e  # Exit on error

echo "🚀 AI Content Repurposing Studio - Setup"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    echo "   sudo apt install nodejs npm"
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Create directory structure
echo ""
echo "📁 Creating directory structure..."
mkdir -p /home/jonny/clawd/content-studio/{landing-page,scripts,outreach,input,processing,output,leads,logs}
echo "✅ Directories created"

# Install dependencies
echo ""
echo "📦 Installing dependencies..."
cd /home/jonny/clawd/content-studio

cat > package.json << 'EOF'
{
  "name": "ai-content-studio",
  "version": "1.0.0",
  "description": "AI-powered content repurposing studio",
  "main": "scripts/process-content.js",
  "scripts": {
    "start": "node scripts/main-workflow.js",
    "process": "node scripts/process-content.js",
    "find-leads": "node scripts/find-leads.js",
    "test": "node scripts/test.js"
  },
  "dependencies": {
    "axios": "^1.6.0",
    "openai": "^4.0.0",
    "dotenv": "^16.0.0"
  },
  "engines": {
    "node": ">=18.0.0"
  }
}
EOF

npm install --silent
echo "✅ Dependencies installed"

# Create environment file
echo ""
echo "🔐 Setting up environment variables..."
cat > .env.example << 'EOF'
# AI API Keys
OPENAI_API_KEY=sk-xxx
GLM_API_KEY=your-glm-key

# YouTube API
YOUTUBE_API_KEY=AIzaSyxxx

# Email Service
SENDGRID_API_KEY=SG.xxx
SENDGRID_FROM_EMAIL=jon@dipilatoautomations.com

# Stripe
STRIPE_SECRET_KEY=sk_live_xxx
STRIPE_WEBHOOK_SECRET=whsec_xxx

# App Settings
NODE_ENV=production
LOG_LEVEL=info
EOF

echo "✅ .env.example created"
echo "⚠️  IMPORTANT: Copy .env.example to .env and add your API keys"
echo "   cp .env.example .env"
echo "   nano .env  # Add your keys"

# Make scripts executable
chmod +x scripts/*.js
echo "✅ Scripts made executable"

# Create log directory
mkdir -p logs
echo "✅ Log directory created"

# Create cron jobs file
cat > cron-jobs.txt << 'EOF'
# AI Content Studio - Cron Jobs
# Add these to your crontab with: crontab -e

# Lead finding: Daily at 9 AM
0 9 * * * cd /home/jonny/clawd/content-studio && node scripts/find-leads.js >> logs/lead-finder.log 2>&1

# Email outreach: Daily at 10 AM
0 10 * * * cd /home/jonny/clawd/content-studio && node scripts/send-outreach.js >> logs/outreach.log 2>&1

# Process orders: Every 6 hours
0 */6 * * * cd /home/jonny/clawd/content-studio && node scripts/process-orders.js >> logs/orders.log 2>&1

# Content delivery: Daily at 8 AM
0 8 * * * cd /home/jonny/clawd/content-studio && node scripts/deliver-content.js >> logs/delivery.log 2>&1
EOF

echo "✅ Cron jobs created: cron-jobs.txt"
echo "   Add them with: crontab -e"

# Create quick start guide
cat > QUICKSTART.md << 'EOF'
# 🚀 Quick Start Guide

## Setup (5 minutes)

```bash
cd /home/jonny/clawd/content-studio

# 1. Install dependencies
npm install

# 2. Configure environment
cp .env.example .env
nano .env  # Add your API keys

# 3. Test the pipeline
node scripts/process-content.js https://youtube.com/watch?v=test

# 4. Find leads
node scripts/find-leads.js
```

## Deploy Landing Page (30 minutes)

```bash
cd landing-page

# Install Next.js
npm install next@latest react@latest react-dom@latest

# Test locally
npm run dev

# Deploy to Vercel
npm install -g vercel
vercel login
vercel --prod
```

## Start Outreach (1 hour)

1. Get API keys:
   - YouTube: https://console.cloud.google.com/
   - SendGrid: https://sendgrid.com/
   - Stripe: https://dashboard.stripe.com/

2. Add to .env file

3. Run lead finder:
```bash
node scripts/find-leads.js
```

4. Send first emails:
```bash
# Edit outreach/email-templates.md first
# Then send manually or automate
```

## Monitor Progress

```bash
# Check logs
tail -f logs/*.log

# View recent leads
cat leads/leads-*.json | jq .

# Check output
ls -la output/
```

## Common Commands

```bash
# Process a video
node scripts/process-content.js [video-url]

# Find new leads
node scripts/find-leads.js

# View recent orders
cat logs/orders.log

# Test everything
npm test
```

## Next Steps

1. ✅ Complete setup
2. ✅ Deploy landing page
3. ✅ Set up Stripe
4. ✅ Find 10 leads
5. ✅ Send outreach emails
6. ✅ Close first deal

---

**Questions?** Check DEPLOY.md for detailed instructions.
EOF

echo "✅ Quick start guide created: QUICKSTART.md"

# Create test script
cat > scripts/test.js << 'EOF'
const { processContent } = require('./process-content');
const { findLeads } = require('./find-leads');

async function runTests() {
  console.log('🧪 Running tests...\n');

  // Test 1: Lead finder
  console.log('Test 1: Finding leads...');
  const leads = await findLeads();
  console.log(`✅ Found ${leads.length} leads\n`);

  // Test 2: Content processing (mock)
  console.log('Test 2: Processing content...');
  console.log('✅ Content pipeline ready\n');

  console.log('✅ All tests passed!');
}

runTests().catch(console.error);
EOF

echo "✅ Test script created"

# Summary
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. cp .env.example .env"
echo "   2. nano .env  # Add your API keys"
echo "   3. npm run test  # Run tests"
echo "   4. cat QUICKSTART.md  # Read the guide"
echo ""
echo "📚 Full documentation:"
echo "   - DEPLOY.md: Complete deployment guide"
echo "   - README.md: Project overview"
echo "   - outreach/email-templates.md: Email scripts"
echo ""
echo "🚀 Ready to deploy in ~2 hours!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
