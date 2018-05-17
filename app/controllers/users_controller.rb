class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def create
    @user = User.new(params[:user])
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
      require 'uri'
      require 'net/http'
      name = @user.name
      @user.otp = rand(999999).to_s
      pass = "Hi #{name}, This is your one time password:" + @user.otp
      phone = @user.phone
      url = URI("https://api.textlocal.in/send/?username=m.arvind1904@gmail.com&hash=H0tpursuit&sender=TXTLCL&numbers=91#{phone}&message=#{pass}")
      http = Net::HTTP.new(url.host, url.port)
      request = Net::HTTP::Get.new(url)
      response = http.request(request)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.fetch(:user, {})
    end
end
