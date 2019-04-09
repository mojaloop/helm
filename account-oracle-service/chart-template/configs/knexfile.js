'use strict'
const migrationsDirectory = '/home/node/app/migrations'
const seedsDirectory = '/home/node/app/seeds'
const Config = require('/home/node/app/config/default.json')
module.exports = {
    client: 'mysql',
    version: '5.6',
    connection: Config.DATABASE_URI,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migration',
        stub: `${migrationsDirectory}/migration.template`
    },
    seeds: {
        directory: seedsDirectory,
        loadExtensions: ['.js']
    }
}
