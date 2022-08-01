# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token 
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    render json: @user if @user.save
  end

  def update 
    @user.update(user_params)
    render json: @user
  end

  def destroy
    @user.destroy
  end

  private

  def set_user 
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :email, :password)
  end
end
