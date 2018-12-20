'use strict'

const migrationsDirectory = '/opt/mock-pathfinder/migrations'
const Config = require('/opt/mock-pathfinder/src/lib/config')

module.exports = {
    client: 'pg',
    connection: Config.DATABASE_URI,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migrations',
        stub: `${migrationsDirectory}/migration.template`
    }
}