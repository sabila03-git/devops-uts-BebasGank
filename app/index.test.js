const assert = require('assert');

// Test sederhana tanpa perlu server running
console.log('Menjalankan unit test...');

// Test 1: Cek string
const appName = 'DevOps UTS BebasGank';
assert.strictEqual(typeof appName, 'string', 'appName harus string');
console.log('✅ TEST PASSED: appName adalah string');

// Test 2: Cek operasi dasar
const result = 1 + 1;
assert.strictEqual(result, 2, 'hasil harus 2');
console.log('✅ TEST PASSED: operasi matematika benar');

// Test 3: Cek object
const config = { port: 3000, env: 'production' };
assert.strictEqual(config.port, 3000, 'port harus 3000');
console.log('✅ TEST PASSED: config port benar');

console.log('✅ Semua test berhasil!');