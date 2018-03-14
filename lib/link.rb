require_relative './database_connection.rb'
require 'uri'

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
    res = DatabaseConnection.query("INSERT INTO links (url, title) VALUES('#{url[:url]}', '#{url[:title]}') RETURNING id, url, title")
    Link.new(res[0]['id'], res[0]['url'], res[0]['title'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM links WHERE id = #{id}")
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http','https'])}\z/
  end

end
