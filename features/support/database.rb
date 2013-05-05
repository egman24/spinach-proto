require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
    :adapter   => 'mysql2',
    :database  => $DATABASE,
    :encoding  => 'utf8',
    :reconnect => false,
    :pool      => 5,
    :username  => $DATABASE_USERNAME,
    :password  => $DATABASE_PASSWORD,
    :host      => $DATABASE_HOST
)