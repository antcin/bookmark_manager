
require 'pg'

task :test_database_setup do
  conn = PG.connect dbname: :bookmark_manager_test

  conn.exec "TRUNCATE links"

  URLS = {
    'http://www.makersacademy.com' => 'Makers Academy',
    'http://www.facebook.com' => 'Facebook',
    'http://www.google.com' => 'Google'
  }

  URLS.each { |url, title|
    conn.exec "INSERT INTO links (url, title) VALUES ('#{url}', '#{title}')"
  }
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
