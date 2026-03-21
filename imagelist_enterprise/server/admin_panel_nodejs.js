// Simple Admin Panel - License Server (Node.js + Express)

const express = require('express');
const bodyParser = require('body-parser');

const app = express();
app.use(bodyParser.json());

let licenses = [];

// CREATE LICENSE
app.post('/license', (req, res) => {
  const { client, type, expires } = req.body;

  const lic = {
    id: licenses.length + 1,
    client,
    type,
    expires,
    active: true
  };

  licenses.push(lic);

  res.json({ status: 'created', license: lic });
});

// LIST LICENSES
app.get('/license', (req, res) => {
  res.json(licenses);
});

// BLOCK LICENSE
app.post('/license/block/:id', (req, res) => {
  const id = parseInt(req.params.id);

  const lic = licenses.find(l => l.id === id);

  if (lic) {
    lic.active = false;
    res.json({ status: 'blocked' });
  } else {
    res.status(404).json({ error: 'not found' });
  }
});

// VALIDATE (ERP usa isso)
app.post('/validate', (req, res) => {
  const { client } = req.body;

  const lic = licenses.find(l => l.client === client && l.active);

  if (!lic) {
    return res.json({ status: 'INVALID' });
  }

  res.json({
    status: 'OK',
    license: lic.type,
    expires: lic.expires
  });
});

app.listen(3000, () => {
  console.log('Admin Panel + License API running on port 3000');
});
