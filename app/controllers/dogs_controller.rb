class DogsController < ApplicationController
  def index
    dogs = Dog.all
    render json: dogs.as_json
  end

  def show
    id = params[:id]
    dog = Dog.find_by(id: id)
    render json: dog.as_json
  end

  def create
    dog = Dog.new(
      name: name,
      breed: breed,
      age: age,
      location: location
    )
    if dog.save
      render json: dog.as_json
    else
      render json: {errors: dog.errors.full_messages}, status: :bad_request
    end
  end

  def update
    id = params[:id]
    dog = Dog.find_by(id: id)
    if dog.update(
      name: name,
      breed: breed,
      age: age,
      location: location
    )
      render json: dog.as_json
    else
      render json: {errors: dog.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    id = params[:id]
    dog = Dog.find_by(id: id)
    if dog.delete
      render json: {message: "Dog deleted"}
    else
      render json: {errors: dog.errors.full_messages}, status: :bad_request
    end
  end
end
