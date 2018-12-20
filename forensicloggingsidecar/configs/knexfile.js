'use strict'

const migrationsDirectory = '/opt/sidecar/migrations'
const Config = require('/opt/sidecar/src/lib/config')

module.exports = {
    client: 'pg',
    connection: Config.DATABASE_URI,
    migrations: {
        directory: migrationsDirectory,
        tableName: 'migrations',
        stub: `${migrationsDirectory}/migration.template`
    }
}
