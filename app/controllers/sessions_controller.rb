class SessionsController < ApplicationController
  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { message: 'Logged in successfully' }
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def current_user
    if session[:user_id]
      user = User.find(session[:user_id])
      render json: { username: user.username }
    else
      render json: { message: 'Not logged in' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { message: 'Logged out successfully' }
  end
end
