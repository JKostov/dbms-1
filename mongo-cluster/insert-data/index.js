const mongoose = require('mongoose');
const faker = require('faker');
const cliProgress = require('cli-progress');
const { User } = require('./user');

const bar = new cliProgress.SingleBar({}, cliProgress.Presets.shades_classic);
const toInsert = 100000;
bar.start(toInsert, 0);

function start() {
  mongoose.connect(`mongodb://router01:27017,router02:27017/testingDb`, { useNewUrlParser: true });

  const db = mongoose.connection;

  db.createCollection('users');

  db.on('error', console.error.bind(console, 'connection error:'));
  db.once('open', async () => {
    for (let i = 0; i < toInsert; i++) {
      const test = new User({ name: faker.name.findName(), about: faker.lorem.sentences() });
      await test.save();
      bar.update(i+1);
    }

    await db.collection('users').ensureIndex({ name: 'hashed' })
    console.log('done');
    bar.stop();

    process.exit();
  });
}

start();