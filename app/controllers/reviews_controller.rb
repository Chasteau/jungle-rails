class ReviewsController < ApplicationController


  def create
    @product_id = params[:product_id]
    @review = Review.new(review_params)
    # after @review has been initialized, but before calling .save on it:
    @review.user_id = current_user.id
    @review.product_id = @product_id


    if @review.save
      redirect_to product_path(id: @product_id), notice: 'Review created created!'
    else
      redirect_to product_path(id: @product_id)
    end

  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating,
    )
  end
end
