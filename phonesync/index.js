const express = require('express')
let savedIp = null

const PORT = 5001
const app = express()
app.use(express.json());

app.post('/ip', (req, res) => {
  const { ip } = req.body
  savedIp = ip
  res.send(`IP ${ip} saved.`)
})

app.get('/ip', (req, res) => {
  console.log(req.body)
  console.log(savedIp)
  res.send(savedIp)
})

app.get('/', (_, res) => {
  res.send("server active")
})
app.get('/',)

app.listen(PORT, () => console.log("Listening on port ", PORT))
