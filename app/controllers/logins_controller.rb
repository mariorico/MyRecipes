class LoginsController < ApplicationController
  
  def new
    render 'new'
  end
  
  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "Welcome " + chef.name
      redirect_to recipes_path
    else
      flash.now[:danger] = "The email or password does not match"
      render 'new'
    end
  end

  def destroy
     session[:chef_id] = nil
     flash[:success] = "Logged out!"
     redirect_to root_path
  end
end