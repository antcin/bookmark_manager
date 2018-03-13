require 'pg'

class Link

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG.connect(dbname: :bookmark_manager_test)
    else
      conn = PG.connect(dbname: :bookmark_manager)
    end
    res = conn.exec("SELECT * FROM links")
    res.map { |link| link['url'] }
  end
end
