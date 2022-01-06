require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
#require './database_connection_setup'
#require './lib/bookings'
#require_relative './lib/coaching'
#require './lib/user'
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

end