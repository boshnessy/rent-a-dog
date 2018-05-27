class UsersController < ApplicationController
  def show
    id = params[:id]
    user = User.find_by(id: id)
    render json: user.as_json
  end

  def create
    user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
        location: params[:location]
    )
    if user.save
      render json: user.as_json
    else
      render json: {errors: user.errors.full_messages}, status: :bad_request
    end
  end
end
