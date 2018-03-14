
require 'pg'

task :test_database_setup do
  conn = PG.connect dbname: 'bookmark_manager_test'

  conn.exec "TRUNCATE links"

end

task :setup do
  ['bookmark_manager', 'bookmark_manager_test'].each do |database|
    begin
      conn = PG.connect
      conn.exec("CREATE DATABASE #{ database }")
      connect = PG.connect(dbname: database)
      connect.exec("CREATE TABLE links(id SERIAL PRIMARY KEY, url VARCHAR(60), title VARCHAR(60))")
    rescue
      puts "Failed to create #{ database }. It probably already exists"
    end
  end
end
