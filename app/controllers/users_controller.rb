class UsersController < ApplicationController
  def account
  end

  def show
    @user = current_user
  end
end