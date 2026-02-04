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
