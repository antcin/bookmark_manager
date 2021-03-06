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
    link = Link.add(url: params['url'], title: params['title'])
    flash[:notice] = "Please enter a valid URL" unless link
    redirect('/')
  end

  post '/delete' do
    Link.delete(params['id'])
    redirect('/')
  end

  get '/update_link_form' do
    @link = Link.find(params['id'])
    erb :update_link
  end

  post '/update-link' do
    Link.update(params['id'], params)
    redirect('/')
  end

  run! if app_file == $0

end
