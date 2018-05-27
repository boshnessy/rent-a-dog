class RentalsController < ApplicationController
  def index
    rentals = Rental.all 
    render json: rentals.as_json
  end

  def show
    id = params[:id]
    rental = Rental.find_by(id: id)
    render json: rental.as_json
  end

  def create
    rental = Rental.new(
      address: params[:address],
      time: params[:time],
      date: params[:date],
      status: "pending",
      dog_id: params[:dog_id],
      user_id: current_user.id
    )
    if rental.save
      render json: {message: "Rental request sent"}
    else
      render json: {errors: rental.errors.full_messages}, status: :bad_request
    end
  end

  def update
    id = params[:id]
    rental = Rental.find_by(id: id)
    if rental.update(
      address: params[:address],
      time: params[:time],
      date: params[:date],
      status: "pending",
      dog_id: params[:dog_id],
      user_id: current_user.id
    )
      render json: {message: "Rental request updated"}
    else
      render json: {errors: rental.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    id = params[:id]
    rental = Rental.find_by(id: id)
    if rental.delete
      render json: {message: "Rental request deleted"}
    else
      render json: {errors: rental.errors.full_messages}, status: :bad_request
    end
  end
end
