class DoctorsController < ApplicationController

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(params.require(:doctor).permit(:name))

    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end

  end

  def edit
  end
end
