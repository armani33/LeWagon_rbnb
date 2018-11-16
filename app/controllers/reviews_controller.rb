class ReviewsController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @review = Review.new(review_params)
    @review.flat = @flat
    if @review.save
      redirect_to flat_path(@flat)
    else
      render 'flats/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
