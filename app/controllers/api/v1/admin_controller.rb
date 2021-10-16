class Api::V1::AdminController < ApplicationController
  def login
    @admin = Admin.find_by_email(params[:username])
    if @admin&.authenticate(params[:password])
      token, time = user_token(@admin)
      render json: { token: token, exp: time, username: @admin.username },
             status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end
end
