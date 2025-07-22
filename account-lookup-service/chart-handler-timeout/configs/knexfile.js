'use strict'
const migrationsDirectory = '/opt/app/migrations'
const seedsDirectory = '/opt/app/seeds'
const Config = require('/opt/app/src/lib/config')
module.exports = {
    ...Config.DATABASE,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migration',
    },
    seeds: {
        directory: seedsDirectory,
        loadExtensions: ['.js']
    }
}
