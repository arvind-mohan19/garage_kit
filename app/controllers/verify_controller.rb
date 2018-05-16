class VerifyController < ApplicationController
  skip_before_filter :redirect_if_unverified

  # GET /verify
  def new
  end

  # PUT /verify
  def update
    if Time.now > current_user.pin_sent_at.advance(minutes: 60)
      flash.now[:alert] = "Your pin has expired. Please request another."
      render :new and return
    elsif params[:pin].try(:to_i) == current_user.pin
      current_user.update_attribute(:verified, true)
      redirect_to root_url, notice: "Your phone number has been verified!"
    else
      flash.now[:alert] = "The code you entered is invalid."
      render :new
    end
  end

  # POST /verify
  def create
    current_user.send_pin!
    redirect_to new_verify_url, notice: "A PIN number has been sent to your phone"
  end

end