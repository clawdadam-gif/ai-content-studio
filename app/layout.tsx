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
