class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_back_to_requested_url
    else
      flash.now[:alert] = 'Are u a Guru? Verify ur Email and Password please!'
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

  private

  def redirect_back_to_requested_url
    redirect_to cookies.delete(:requested_url) || root_path
  end
end
