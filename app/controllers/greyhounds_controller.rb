class GreyhoundsController < ApplicationController

  get '/greyhounds' do
    if logged_in?
      @greyhounds = Greyhound.all
      erb :'greyhounds/greyhounds'
    else
      redirect '/login'
  end
end

  get '/greyhounds/new' do
    if logged_in?
      erb :'greyhounds/create_greyhound'
    else
      redirect '/login'
    end
  end

  post '/greyhounds' do
    if logged_in?
      if params[:name] == ""
        redirect '/greyhounds/new'
      else
        @greyhound = current_kennel.greyhounds.build(name: params[:name], food: params[:food], time: params[:time], grade: params[:grade])
        if @greyhound.save
          redirect "/greyhounds"
        else
          redirect "greyhounds/new"
        end
      end
    else
      redirect '/login'
    end
  end

  get '/greyhound/:id' do
    if logged_in?
      @greyhound = Greyhound.find_by_id(params[:id])
      erb :'greyhounds/show_greyhound'
    else
      redirect '/login'
  end
end

  get '/greyhounds/:id/edit' do
    if logged_in?
      @greyhound = Greyhound.find_by_id(params[:id])
      if @greyhound.kennel == current_kennel
        erb :'greyhounds/edit_greyhound'
      else
        redirect '/greyhounds'
      end
    else
      redirect '/login'
  end
end

  patch '/greyhounds/:id' do
    binding.pry
    if logged_in?
      if params[:name] == ""
        redirect "/greyhounds/#{params[:kennel_id]}/edit"
      else
        @greyhound = Greyhound.find_by_id(params[:id])
        if @greyhound && @greyhound.kennel == current_kennel
          if @greyhound.update(:name => params[:name], :time => params[:time],:food => params[:food],:grade => params[:grade])
            @greyhound.save
            redirect "/greyhound/#{@greyhound.kennel_id}"
          else
            redirect "/greyhounds/#{@greyhound.kennel_id}/edit"
          end
        else
          redirect '/greyhounds'
        end
      end
    else
      redirect '/login'
    end
  end

  delete '/greyhounds/:id/delete' do
    if logged_in?
      @greyhound = Greyhound.find_by_id(params[:id])
      if @greyhound && @greyhound.kennel == current_kennel
        @greyhound.delete
      end
      redirect '/greyhounds'
    else
      redirect '/login'
    end
  end


  end
