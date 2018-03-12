require 'pg'

class Link

  def self.all
    conn = PG.connect(dbname: :bookmark_manager)
    res = conn.exec("SELECT * FROM links")
    res.map { |link| link['url'] }
  end
end
