# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.fetch(:user, {}).permit(:name, :avatar)
  end
end
