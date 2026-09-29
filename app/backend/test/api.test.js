const test = require("node:test");
const assert = require("node:assert");

const app = require("../src/server");

test("GET /api/info returns application information", async () => {
  const server = app.listen(0);

  try {
    const port = server.address().port;

    const response = await fetch(`http://127.0.0.1:${port}/api/info`);
    const body = await response.json();

    assert.strictEqual(response.status, 200);
    assert.strictEqual(body.application, "DevOps Platform API");
    assert.strictEqual(body.version, "1.0.0");
  } finally {
    server.close();
  }
});

