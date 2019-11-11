'use strict'
const migrationsDirectory = '/opt/account-lookup-service/migrations'
const seedsDirectory = '/opt/account-lookup-service/seeds'
const Config = require('/opt/account-lookup-service/src/lib/config')
module.exports = {
    client: 'mysql',
    version: '5.7',
    connection: Config.DATABASE.connection,
    pool: Config.DATABASE.pool,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migration',
    },
    seeds: {
        directory: seedsDirectory,
        loadExtensions: ['.js']
    }
}
