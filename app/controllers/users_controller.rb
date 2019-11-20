class UsersController < ApplicationController
  
  def show
    @appointments = current_user.appointments
    @user = current_user
  end

end
