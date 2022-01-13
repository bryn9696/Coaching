require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './database_connection_setup'
#require './lib/bookings'
#require_relative './lib/coaching'
require './lib/user'
#require_relative './lib/update'

# App class
class Coaching < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  post '/user_details' do
    session[:username] = params[:username]
    session[:password] = params[:password]
    redirect '/home'
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/sign_up_details' do
    if User.unique_username(params[:username]) == true
      flash[:notice] = 'Thanks for signing up to Coaching'
      User.create_user(params[:username], params[:password], params[:email], params[:phone_number])
      redirect '/login'
    else
      flash[:notice] = 'This username has been taken - please choose a different one!'
      redirect '/sign_up'
    end
  end

  get '/home' do
    erb :home
  end

end