const {  Client } = require('pg');
const  axios  = require('axios');
const fs = require('fs');

const sql = fs.readFileSync('schema.sql').toString();
const connectionString = 'postgres://fchhltfc:vcyFNRGGWwzAIXdQPiTMXcEXz5nYAYLV@satao.db.elephantsql.com:5432/fchhltfc'

const client = new Client({
  connectionString: connectionString,
});
client.connect();
let query = 'SELECT * FROM companies;';
// let query = 'SELECT * FROM pg_catalog.pg_tables;';
client.query(sql, (err, res) => {
  console.log(err, res)
  client.end();
});

// getUser();

async function getUser() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/todos/1');
    console.log(response.data);
  } catch (error) {
    console.error(error);
  }
}
