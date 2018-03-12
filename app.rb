require 'sinatra/base'
require 'link.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    @links = Link.all
    erb(:link)
  end
run! if app_file == $0

end
