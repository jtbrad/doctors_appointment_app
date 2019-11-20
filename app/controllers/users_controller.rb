class UsersController < ApplicationController
  
  def show
    @appointments = current_user.appointments
    @user = current_user
    @doctors = @user.doctors
  end

end
