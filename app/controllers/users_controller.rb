class UsersController < ApplicationController

  def create
    @user = User.new(name: params[:name],username: params[:username], password: params[:password])
    if @user.save
      render json: @user
    end
  end

  def index

  end


  def login
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      render json: @user
    end
  end

end
