class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  include Plivo

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new
    @user.phone_number = params[:user][:phone_number]
    @user.name = params[:user][:name]
    send_sms

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def verify_phone_number
    @user = User.find_by_phone_number(params[:phone_number])
    if @user && (params[:otp] == @user.otp)
      device = Device.find_by_user_id(@user.id)
      device.logged_in = true
      device.save
        session[:user_id] = @user.id
    end
  end

  def update
    if @user.update(params[:user])
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

    def send_sms
      require 'rubygems'
      require 'plivo'
      @user.otp = rand(999999).to_s
      name = @user.name
      client = RestClient.new('MAYZLHNDI5MZHKYZM0OD', 'MjU4M2E0MmExNjgzMGMxOTIzOWM3NjRjNWZlNzNk')
      phone = @user.phone_number
      pass = "Hi #{name}, This is your one time password:" + @user.otp

      message_created = client.messages.create(
       '919080510262',
       ["91#{phone}"],
       "#{pass}"
      )
    end

    def set_user
      @user = User.find(params[:id])
    end

end
