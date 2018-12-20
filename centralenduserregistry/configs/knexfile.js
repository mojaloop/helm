'use strict'

const migrationsDirectory = '/opt/central-end-user-registry/migrations'
const Config = require('/opt/central-end-user-registry/src/lib/config')
module.exports = {
    client: 'pg',
    connection: Config.DATABASE_URI,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migrations',
        stub: `${migrationsDirectory}/migration.template`
    }
}