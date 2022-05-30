'use strict'

const migrationsDirectory = '/opt/app/migrations'
const seedsDirectory = '/opt/app/seeds'

const Config = require('/opt/app/src/lib/config')

module.exports = {
  client: 'mysql',
  connection: Config.DATABASE.connection,
  pool: Config.DATABASE.pool,
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
