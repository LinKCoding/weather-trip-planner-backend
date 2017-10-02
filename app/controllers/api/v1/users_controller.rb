class Api::V1::UsersController < ApplicationController

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
    if @user && @user.authenticate(params[:password])
      render json: @user
    else
      render json: {status: "error", code: 401}
    end
  end

end
