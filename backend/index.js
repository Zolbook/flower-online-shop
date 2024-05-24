const express = require('express');

const cors = require('cors');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();


const app = express();
app.use(cors());
app.use(express.json());
const port = 3008;
app.use('/images', express.static('public/images'));

app.get('/flowers', async (req, res) => {
  try {
    const flowers = await prisma.flowers.findMany();
    res.json(flowers);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});



app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
