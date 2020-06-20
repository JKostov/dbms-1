sh.enableSharding('testingDb')

db.adminCommand( { shardCollection: 'testingDb.users', key: { name: 'hashed' } } )