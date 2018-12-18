'use strict'

const migrationsDirectory = '/opt/central-directory/migrations'
const Config = require('/opt/central-directory/src/lib/config')

module.exports = {
    client: 'pg',
    connection: Config.DATABASE_URI,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migrations',
        stub: `${migrationsDirectory}/migration.template`
    }
}