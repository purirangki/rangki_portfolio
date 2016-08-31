class PlacesReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_places_review, only: [:edit, :update, :destroy]

  def edit
    
  end

  def create
    @places_review = current_user.places_reviews.new(places_review_params)

    respond_to do |format|
      if @places_review.save
        format.html { redirect_to place_path(@places_review.place), notice: 'Review was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @places_review.update(places_review_params)
        format.html { redirect_to place_path(@places_review.place), notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @places_review.destroy
    respond_to do |format|
      format.html { redirect_to place_path(@places_review.place), notice: 'Review was successfully destroyed.' }
    end
  end

  private
    def set_places_review
      @places_review = PlacesReview.find(params[:id])
    end

    def places_review_params
      params.require(:places_review).permit(:content, :place_id, :score)
    end
end