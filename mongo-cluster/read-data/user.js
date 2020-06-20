const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name: String,
  about: String,
});

const User = mongoose.model('users', userSchema);

module.exports = { User, userSchema }