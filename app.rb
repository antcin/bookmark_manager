require 'sinatra/base'
require './lib/link'
require './database_connection_setup'
require 'sinatra/flash'
require 'uri'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb(:link)
  end

  post '/add' do
    flash[:notice] = "Please enter a valid URL" unless Link.add(params[:url])
    redirect('/')
  end

  run! if app_file == $0

end
