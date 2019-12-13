const {  Client } = require('pg');
const  axios  = require('axios');
const fs = require('fs');

const query = fs.readFileSync('schema.sql').toString();

const connectionString = 'postgres://fchhltfc:vcyFNRGGWwzAIXdQPiTMXcEXz5nYAYLV@satao.db.elephantsql.com:5432/fchhltfc';

const con = new Client({
  connectionString: connectionString
});

con.connect(async function (err) {
  if (err) return console.error(err);
  console.log("Successfully connected");
  await runQuery(query);
  await getUsers();
  await getPosts();
  await getComments();
  await getAlbums();
  await getPhotos();
  await getTodos();
  con.end();
});

function runQuery(sql) {
  return new Promise((resolve, reject) => {
    console.log("query is", sql);
    con.query(sql, function (err, result) {
      if (err) reject(err);
      // console.log("result is", result);
      return resolve(result);
    });
  });
}

async function getPhotos() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/photos');
    for (let photo of response.data) {
      await addPhoto(photo);
    }
  } catch (error) {
    console.error(error);
  }
}

async function getTodos() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/todos');
    for (let todo of response.data) {
      await addTodo(todo);
    }
  } catch (error) {
    console.error(error);
  }
}

async function getAlbums() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/albums');
    for (let album of response.data) {
      await addAlbum(album);
    }
  } catch (error) {
    console.error(error);
  }
}

async function getComments() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/comments');
    for (let comment of response.data) {
      await addComment(comment);
    }
  } catch (error) {
    console.error(error);
  }
}

async function getPosts() {
  try {
    const response = await axios.get('https://jsonplaceholder.typicode.com/posts');
    for (let post of response.data) {
      await addPost(post);
    }
  } catch (error) {
    console.error(error);
  }
}

async function getUsers() {
  try {
    let userId, addressId;
    const response = await axios.get('https://jsonplaceholder.typicode.com/users');
    for (let user of response.data) {
      userId = await addUser(user);
      addressId = await addAddress(user, userId);
      await addGeo(user, addressId);
      await addCompany(user, userId);
    }
  } catch (error) {
    console.error(error);
  }
}

async function addUser(user) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO users_dhruva (u_name,u_username,u_email,u_website,u_phone) VALUES ('${user.name}','${user.username}','${user.email}','${user.website}','${user.phone}')`;

      let response = await runQuery(sql);
      if (response) {
        sql = `SELECT u_id FROM users_dhruva WHERE u_username = '${user.username}'`;

        let userId = await runQuery(sql);
        if (userId.rows[0].u_id) return resolve(userId.rows[0].u_id);
      }
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addPost(post) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO posts_dhruva (p_userId,p_title,p_body) VALUES ('${post.userId}','${post.title}','${post.body}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addTodo(todo) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO todos_dhruva (t_userId,t_title,t_completed) VALUES ('${todo.userId}','${todo.title}','${todo.completed}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addAlbum(album) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO albums_dhruva (a_userId,a_title) VALUES ('${album.userId}','${album.title}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addPhoto(photo) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO photos_dhruva (p_albumId,p_title,p_url,p_thumbnailUrl) VALUES ('${photo.albumId}','${photo.title}','${photo.url}','${photo.thumbnailUrl}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addComment(comment) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO comments_dhruva (c_postId,c_name,c_email,c_body) VALUES ('${comment.postId}','${comment.name}','${comment.email}','${comment.body}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addAddress(user, userId) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO userAddress_dhruva (ua_userId,ua_street,ua_suite,ua_city,ua_zipcode) VALUES ('${userId}','${user.address.street}','${user.address.suite}','${user.address.city}','${user.address.zipcode}')`;

      let response = await runQuery(sql);
      if (response) {
        sql = `SELECT ua_id FROM userAddress_dhruva WHERE ua_userId = '${userId}'`;

        let addressId = await runQuery(sql);
        if (addressId.rows[0].ua_id) return resolve(addressId.rows[0].ua_id);
      } 
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addGeo(user, addressId) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO userAddressGeo_dhruva (uag_addressId,uag_lat,uag_lng) VALUES ('${addressId}','${user.address.geo.lat}','${user.address.geo.lng}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

async function addCompany(user, userId) {
  return new Promise(async (resolve, reject) => {
    try {
      let sql = `INSERT INTO userCompany_dhruva (uc_userId,uc_name,uc_catchPhrase,uc_bs) VALUES ('${userId}','${user.company.name}','${user.company.catchPhrase}','${user.company.bs}')`;

      let response = await runQuery(sql);
      if (response) return resolve(true);
    } catch (err) {
      console.error(err);
      reject(err);
    }
  });
}

