class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :update, :destroy]


  #booked : 1, started:2, end:3

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def create
    @appointment = Appointment.new(appointment_params)

    if @appointment.save
      render :show, status: :created, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def update
    if @appointment.update(appointment_params)
      render :show, status: :ok, location: @appointment
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @appointment.destroy
  end

  def start_booking
    @appointment = Appointment.find_by_id(params[:id])
    @appointment.status = 2 
    @appointment.save
  end

  def end_booking
    @appointment = Appointment.find_by_id(params[:id])
    @appointment.status = 3 
    @appointment.save
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.fetch(:appointment, {})
    end
end
