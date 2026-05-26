const http = require('http');

// Simple test tanpa framework tambahan
function runTest() {
  const options = {
    hostname: 'localhost',
    port: 3000,
    path: '/',
    method: 'GET'
  };

  const req = http.request(options, (res) => {
    let data = '';
    res.on('data', (chunk) => { data += chunk; });
    res.on('end', () => {
      if (res.statusCode === 200) {
        console.log('✅ TEST PASSED: Server merespons dengan status 200');
        console.log('✅ TEST PASSED: Response:', data.trim());
        process.exit(0);
      } else {
        console.log('❌ TEST FAILED: Status code bukan 200');
        process.exit(1);
      }
    });
  });

  req.on('error', (e) => {
    console.log('❌ TEST FAILED:', e.message);
    process.exit(1);
  });

  req.end();
}

// Tunggu server siap dulu
setTimeout(runTest, 1000);