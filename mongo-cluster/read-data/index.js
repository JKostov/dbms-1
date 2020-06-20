const mongoose = require('mongoose');
const { User } = require('./user');

function start() {
  mongoose.connect(`mongodb://router01:27017,router02:27017/testingDb`, { useNewUrlParser: true });

  const db = mongoose.connection;

  db.on('error', console.error.bind(console, 'connection error:'));
  db.once('open', async () => {

    const users = await User.find({ name: { $regex: '.*Jarvis.*' } });
    users.forEach(user => {
      console.log(user.name);
    });

    process.exit();
  });
}

start();