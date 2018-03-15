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

  get '/update-link/:id' do
    @link_id = params['id']
    erb :update_link
  end

  post '/update-link' do
    conn = PG.connect(dbname: 'bookmark_manager_test')
    conn.exec("UPDATE links SET url = '#{params['url']}', title = '#{params['title']}' WHERE id = '#{params['id']}'")

    redirect('/')
  end

  run! if app_file == $0

end
