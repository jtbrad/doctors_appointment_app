class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def show
  end

  def new
    @doctors = Doctor.all
    @appointment = @user.appointments.new
  end

  def create
    @appointment = @user.appointments.new(appointment_params)

    if @appointment.save
      redirect_to user_path(@user)
    else
      render :new
    end

  end

  def edit
    @doctors = Doctor.all
  end

  def update

    if @appointment.update(appointment_params)
      redirect_to user_appointment_path(@user, @appointment)
    else
      render :edit
    end

  end

  def destroy
    @appointment.destroy
    redirect_to user_path(@user)
  end

  private

    def set_user
      @user = current_user
    end

    def set_appointment
      @appointment = @user.appointments.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:month, :day, :time, :doctor_id)
    end

end
