class UsersController < ApplicationController

  def create
    # byebug
    @user = User.new(name: params[:name],username: params[:username], password: params[:password])
    if @user.save
      render json: @user
    end
  end

  def index

  end


end
