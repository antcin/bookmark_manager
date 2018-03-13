require_relative './database_connection.rb'

class Link

  def self.all
    res = DatabaseConnection.query('SELECT * FROM links')
    res.map { |link| link['url'] }
  end

  def self.add(url)
    return false unless is_url?(url)
    DatabaseConnection.query("INSERT INTO links (url) VALUES ('#{url}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http','https'])}\z/
  end

end
