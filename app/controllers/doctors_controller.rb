class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
    @appointments = @doctor.appointments
    @users = @doctor.users
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end

  end

  def edit

  end

  def update
    
    if @doctor.update(doctor_params)
      redirect_to doctor_path(@doctor)
    else
      render :edit
    end

  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name)
    end

end
