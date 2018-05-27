class ReviewsController < ApplicationController
  def index
    reviews = Review.all 
    render json: reviews.as_json
  end

  def create
    review = Review.new(
      stars: params[:stars],
      comment: params[:comment],
      dog_id: params[:dog_id],
      user_id: current_user.id
    )
    if review.save
      render json: review.as_json
    else
      render json: {errors: review.errors.full_messages}, status: :bad_request
    end
  end
end
