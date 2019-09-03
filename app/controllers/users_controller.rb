class UsersController < ApplicationController
  def show
    @users = User.where.not(id: current_user.id)
  end

  def update 
    @user = User.where(id: params[:id])[0]
    @user.role = params[:user][:role]
    @user.save
  end
end
