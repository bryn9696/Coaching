# frozen_string_literal: true

require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('coaching_test')

  DatabaseConnection.query("ALTER SEQUENCE users_id_seq RESTART WITH 1;")
  DatabaseConnection.query("ALTER SEQUENCE jobs_id_seq RESTART WITH 1;")
  DatabaseConnection.query("ALTER SEQUENCE bookings_id_seq RESTART WITH 1;")
else
  DatabaseConnection.setup('coaching')
end
