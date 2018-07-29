class KennelsController < ApplicationController

  get '/kennels/:id' do
  @kennel = Kennel.find_by_id(params[:id])
  erb :'kennels/show'
end

get '/signup' do
  if !logged_in?
    erb :'kennels/create_kennel', locals: {message: "Please sign up before you sign in"}
  else
    redirect to '/greyhounds'
  end
end

post '/signup' do
  if params[:name] == "" || params[:email] == "" || params[:password] == ""
    redirect to '/signup'
  else
    @kennel = Kennel.new(:name => params[:name], :email => params[:email], :password => params[:password])
    @kennel.save
    session[:kennel_id] = @kennel.id
    redirect to '/kennels/show'
  end
end

get '/login' do
  if !logged_in?
    erb :'kennels/login'
  else
    redirect to '/kennels/show'
  end
end

post '/login' do
  kennel = Kennel.find_by(:name => params[:name])
  if kennel && kennel.authenticate(params[:password])
    session[:kennel_id] = kennel.id
    redirect to "/greyhounds"
  else
    redirect to '/signup'
  end
end

get '/logout' do
  if logged_in?
    session.destroy
    redirect to '/'
  else
    redirect to '/'
    end
  end
end
