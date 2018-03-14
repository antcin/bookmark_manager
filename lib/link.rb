require_relative './database_connection.rb'

class Link

  attr_reader :id, :url, :title

  def initialize(id, url, title)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    res = DatabaseConnection.query('SELECT * FROM links')
    res.map { |link| Link.new(link['id'], link['url'], link['title']) }
  end

  def self.add(url)
    return false unless is_url?(url[:url])
    DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{url[:url]}', '#{url[:title]}')")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http','https'])}\z/
  end

end
