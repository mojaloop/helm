'use strict'

const migrationsDirectory = '/opt/central-ledger/migrations'
const seedsDirectory = '/opt/central-ledger/seeds'

const Config = require('/opt/central-ledger/src/lib/config')

module.exports = {
    client: 'mysql',
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