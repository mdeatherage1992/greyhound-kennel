require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "kennel_secret"
  end

  get '/' do
    erb :index
  end

  helpers do

    def logged_in?
      !!session[:kennel_id]
    end

    def current_kennel
    Kennel.find(session[:kennel_id]) if session[:kennel_id]
    end


  end

end
