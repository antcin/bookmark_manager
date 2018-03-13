require 'pg'

conn = PG.connect dbname: :bookmark_manager_test

conn.exec "TRUNCATE links"

URLS = [
  'http://www.makersacademy.com',
  'http://www.facebook.com',
  'http://www.google.com'
]

URLS.each { |url|
  conn.exec "INSERT INTO links (url) VALUES ('#{url}')"
}
