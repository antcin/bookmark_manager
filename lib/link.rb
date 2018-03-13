require_relative './database_connection.rb'

class Link

  def self.all
    res = DatabaseConnection.query('SELECT * FROM links')
    res.map { |link| link['url'] }
  end

  def self.add(url)
    res = DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{url}')")
  end

end
