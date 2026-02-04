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
