const { Client } = require('pg')
require('dotenv').config() 
 
const client = new Client({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: 'postgres',
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
  })

module.exports = { client }