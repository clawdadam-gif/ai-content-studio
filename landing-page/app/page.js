import Link from 'next/link';

export default function LandingPage() {
  return (
    <main className="min-h-screen bg-gradient-to-b from-slate-900 to-slate-800 text-white">
      {/* Hero Section */}
      <section className="container mx-auto px-4 py-20 text-center">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-5xl md:text-6xl font-bold mb-6 bg-gradient-to-r from-blue-400 to-purple-500 bg-clip-text text-transparent">
            Turn 1 Video Into 10+ Pieces of Content
          </h1>
          <p className="text-xl md:text-2xl text-slate-300 mb-8">
            Stop spending hours on content creation. Our AI repurposes your YouTube videos, podcasts, and newsletters into blogs, social posts, and more—automatically.
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Link href="#pricing" className="bg-blue-600 hover:bg-blue-700 px-8 py-4 rounded-lg text-lg font-semibold transition">
              See Pricing
            </Link>
            <Link href="#how-it-works" className="bg-slate-700 hover:bg-slate-600 px-8 py-4 rounded-lg text-lg font-semibold transition">
              How It Works
            </Link>
          </div>
        </div>
      </section>

      {/* Problem/Solution */}
      <section className="container mx-auto px-4 py-16">
        <div className="max-w-6xl mx-auto grid md:grid-cols-2 gap-12">
          <div className="bg-red-900/20 border border-red-800 rounded-lg p-8">
            <h2 className="text-2xl font-bold mb-4 text-red-400">😩 The Old Way</h2>
            <ul className="space-y-3 text-slate-300">
              <li>❌ Spend 10+ hours manually repurposing content</li>
              <li>❌ Hire expensive writers ($500-$2000/month)</li>
              <li>❌ Miss publishing opportunities (forget to cross-post)</li>
              <li>❌ Burn out trying to be everywhere at once</li>
            </ul>
          </div>
          <div className="bg-green-900/20 border border-green-800 rounded-lg p-8">
            <h2 className="text-2xl font-bold mb-4 text-green-400">😎 The New Way</h2>
            <ul className="space-y-3 text-slate-300">
              <li>✅ Upload 1 video, get 10+ pieces in 48 hours</li>
              <li>✅ AI-powered, human-edited for quality</li>
              <li>✅ Consistent content across all platforms</li>
              <li>✅ 10x your output without 10x the work</li>
            </ul>
          </div>
        </div>
      </section>

      {/* How It Works */}
      <section id="how-it-works" className="container mx-auto px-4 py-16 bg-slate-800/50">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl font-bold text-center mb-12">How It Works</h2>
          <div className="grid md:grid-cols-3 gap-8">
            <div className="text-center">
              <div className="text-5xl mb-4">📤</div>
              <h3 className="text-xl font-bold mb-2">1. Upload Your Content</h3>
              <p className="text-slate-300">Send us your YouTube video, podcast episode, or newsletter. That's it.</p>
            </div>
            <div className="text-center">
              <div className="text-5xl mb-4">🤖</div>
              <h3 className="text-xl font-bold mb-2">2. AI Repurposes Everything</h3>
              <p className="text-slate-300">Our AI transcribes, analyzes, and creates 10+ pieces optimized for each platform.</p>
            </div>
            <div className="text-center">
              <div className="text-5xl mb-4">📥</div>
              <h3 className="text-xl font-bold mb-2">3. Review & Publish</h3>
              <p className="text-slate-300">Get everything in 48 hours. Review, tweak if needed, then publish everywhere.</p>
            </div>
          </div>
        </div>
      </section>

      {/* What You Get */}
      <section className="container mx-auto px-4 py-16">
        <div className="max-w-4xl mx-auto">
          <h2 className="text-4xl font-bold text-center mb-12">What You Get From Each Video</h2>
          <div className="grid sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              { emoji: '📝', title: 'Blog Post', desc: '1000-word SEO-optimized article' },
              { emoji: '🐦', title: '3 Tweets', desc: 'Thread-ready Twitter posts' },
              { emoji: '💼', title: 'LinkedIn', desc: 'Professional long-form post' },
              { emoji: '📸', title: 'Instagram', desc: 'Caption + hashtag sets' },
              { emoji: '📧', title: 'Newsletter', desc: 'Email digest version' },
              { emoji: '🎵', title: 'TikTok Script', desc: 'Short-form video script' },
              { emoji: '📊', title: 'Summary', desc: 'Key points & quotes' },
              { emoji: '❓', title: 'FAQ Content', desc: 'Q&A from your video' },
            ].map((item, i) => (
              <div key={i} className="bg-slate-800 rounded-lg p-6 text-center hover:bg-slate-700 transition">
                <div className="text-4xl mb-3">{item.emoji}</div>
                <h3 className="font-bold mb-2">{item.title}</h3>
                <p className="text-sm text-slate-400">{item.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Pricing */}
      <section id="pricing" className="container mx-auto px-4 py-16 bg-slate-800/50">
        <div className="max-w-5xl mx-auto">
          <h2 className="text-4xl font-bold text-center mb-4">Simple, Transparent Pricing</h2>
          <p className="text-center text-slate-400 mb-12">No contracts. Cancel anytime. 48-hour turnaround guaranteed.</p>

          <div className="grid md:grid-cols-3 gap-8">
            {/* Starter */}
            <div className="bg-slate-900 rounded-xl p-8 border border-slate-700 hover:border-blue-500 transition">
              <h3 className="text-2xl font-bold mb-2">Fast Start</h3>
              <div className="text-4xl font-bold mb-4">$97</div>
              <p className="text-slate-400 mb-6">Perfect for testing the waters</p>
              <ul className="space-y-3 mb-8">
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>1 video repurposed</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>5 pieces of content</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>48-hour delivery</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>1 revision included</span>
                </li>
              </ul>
              <button className="w-full bg-slate-700 hover:bg-slate-600 py-3 rounded-lg font-semibold transition">
                Get Started
              </button>
            </div>

            {/* Growth - Popular */}
            <div className="bg-gradient-to-b from-blue-900/40 to-slate-900 rounded-xl p-8 border-2 border-blue-500 relative">
              <div className="absolute -top-4 left-1/2 transform -translate-x-1/2 bg-blue-600 px-4 py-1 rounded-full text-sm font-bold">
                MOST POPULAR
              </div>
              <h3 className="text-2xl font-bold mb-2">Growth</h3>
              <div className="text-4xl font-bold mb-4">$297</div>
              <p className="text-slate-400 mb-6">For serious content creators</p>
              <ul className="space-y-3 mb-8">
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>4 videos repurposed</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>20 pieces of content</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Content calendar</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Unlimited revisions</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Priority support</span>
                </li>
              </ul>
              <button className="w-full bg-blue-600 hover:bg-blue-700 py-3 rounded-lg font-semibold transition">
                Get Started
              </button>
            </div>

            {/* Autopilot */}
            <div className="bg-slate-900 rounded-xl p-8 border border-slate-700 hover:border-purple-500 transition">
              <h3 className="text-2xl font-bold mb-2">Autopilot</h3>
              <div className="text-4xl font-bold mb-4">$497<span className="text-lg text-slate-400">/mo</span></div>
              <p className="text-slate-400 mb-6">We handle everything</p>
              <ul className="space-y-3 mb-8">
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Weekly repurposing</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Unlimited content</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Dedicated manager</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Strategy calls</span>
                </li>
                <li className="flex items-center gap-2">
                  <span className="text-green-400">✓</span>
                  <span>Custom templates</span>
                </li>
              </ul>
              <button className="w-full bg-slate-700 hover:bg-slate-600 py-3 rounded-lg font-semibold transition">
                Get Started
              </button>
            </div>
          </div>
        </div>
      </section>

      {/* CTA */}
      <section className="container mx-auto px-4 py-20">
        <div className="max-w-3xl mx-auto text-center bg-gradient-to-r from-blue-900/40 to-purple-900/40 rounded-xl p-12 border border-blue-700">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">Ready to 10x Your Content?</h2>
          <p className="text-xl text-slate-300 mb-8">
            Join creators who are saving 10+ hours per week and growing faster than ever.
          </p>
          <button className="bg-blue-600 hover:bg-blue-700 px-8 py-4 rounded-lg text-lg font-semibold transition">
            Start With Fast Start - $97
          </button>
          <p className="text-sm text-slate-400 mt-4">48-hour delivery guaranteed or your money back</p>
        </div>
      </section>

      {/* Footer */}
      <footer className="container mx-auto px-4 py-8 border-t border-slate-700">
        <div className="max-w-6xl mx-auto flex flex-col md:flex-row justify-between items-center">
          <div className="text-slate-400 mb-4 md:mb-0">
            © 2026 Dipilato Automations. All rights reserved.
          </div>
          <div className="flex gap-6 text-slate-400">
            <Link href="#" className="hover:text-white transition">Privacy</Link>
            <Link href="#" className="hover:text-white transition">Terms</Link>
            <Link href="#" className="hover:text-white transition">Contact</Link>
          </div>
        </div>
      </footer>
    </main>
  );
}
