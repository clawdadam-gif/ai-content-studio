#!/bin/bash

# MINIMAL DEPLOYMENT CHECKLIST
# As much automated as possible

echo "🚀 AI Content Studio - Minimal Deployment"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Create the landing page package.json
echo "📦 Setting up landing page..."
cd /home/jonny/clawd/content-studio/landing-page

mkdir -p app
mv page.js app/page.js 2>/dev/null || cp page.js app/page.js 2>/dev/null || true

# Create proper Next.js structure
cat > package.json << 'EOF'
{
  "name": "ai-content-studio-landing",
  "version": "1.0.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "lint": "next lint"
  },
  "dependencies": {
    "next": "14.0.4",
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "@types/node": "^20.0.0",
    "@types/react": "^18.2.0",
    "typescript": "^5.0.0"
  }
}
EOF

# Create tailwind config
cat > tailwind.config.ts << 'EOF'
import type { Config } from 'tailwindcss'

const config: Config = {
  content: [
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}
export default config
EOF

# Create postcss config
cat > postcss.config.js << 'EOF'
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
EOF

# Create globals CSS
mkdir -p app
cat > app/globals.css << 'EOF'
@tailwind base;
@tailwind components;
@tailwind utilities;
EOF

# Create layout
cat > app/layout.tsx << 'EOF'
import './globals.css'

export const metadata = {
  title: 'AI Content Repurposing Studio',
  description: 'Turn 1 video into 10+ pieces of content automatically',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
EOF

# Install dependencies
echo "📦 Installing Next.js dependencies..."
npm install --silent

echo "✅ Landing page setup complete!"
echo ""
echo "📋 Human tasks remaining (30 minutes total):"
echo ""
echo "1. Vercel Deployment (5 min):"
echo "   • Go to: https://vercel.com/signup"
echo "   • Sign up with GitHub/Google"
echo "   • Click 'Add New Project'"
echo "   • Select: /home/jonny/clawd/content-studio/landing-page"
echo "   • Click 'Deploy'"
echo "   • Done! (Vercel gives you a URL)"
echo ""
echo "2. Stripe Setup (10 min):"
echo "   • Go to: https://dashboard.stripe.com/register"
echo "   • Create account (free)"
echo "   • Create 3 products:"
echo "     - Fast Start: $97 (one-time)"
echo "     - Growth: $297 (one-time)"
echo "     - Autopilot: $497 (recurring monthly)"
echo "   • Get API keys (Dashboard → Developers → API keys)"
echo "   • Save keys for step 4"
echo ""
echo "3. YouTube API (5 min):"
echo "   • Go to: https://console.cloud.google.com/"
echo "   • Create project (free)"
echo "   • Enable 'YouTube Data API v3'"
echo "   • Create API key (Credentials → Create Credentials)"
echo "   • Save key for step 4"
echo ""
echo "4. Add API Keys (5 min):"
echo "   cd /home/jonny/clawd/content-studio"
echo "   cp .env.example .env"
echo "   nano .env"
echo "   # Add your keys:"
echo "   YOUTUBE_API_KEY=your-key-here"
echo "   STRIPE_SECRET_KEY=sk_live_xxx"
echo "   STRIPE_PUBLISHABLE_KEY=pk_live_xxx"
echo ""
echo "5. First Lead Run (2 min):"
echo "   cd /home/jonny/clawd/content-studio"
echo "   node scripts/find-leads.js"
echo "   # Check: cat leads/leads-*.json"
echo ""
echo "6. First Outreach (3 min):"
echo "   # Open: outreach/email-templates.md"
echo "   # Copy Template 1"
echo "   # Send to 5-10 leads from step 5"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "⚡ Quick links:"
echo "   Vercel: https://vercel.com/signup"
echo "   Stripe: https://dashboard.stripe.com/register"
echo "   YouTube API: https://console.cloud.google.com/"
echo ""
echo "📚 Full guide: DEPLOY.md"
echo "🎯 Questions? Just ask!"
echo ""
echo "✅ Everything else is automated!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
