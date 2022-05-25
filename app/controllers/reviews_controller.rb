class ReviewsController < ApplicationController
    # new, create, destroy, 2 private methods set_restaurant, review_params
    before_action :set_restaurant, only:[:new, :create]
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.restaurant = @restaurant
        if @review.save 
            redirect_to restaurant_path(@restaurant)
        else
            render :new
        end
    end

    def destroy
        @review.destroy()
    end

private

    def set_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def review_params
        params.require(:review).permit(:rating, :content)
    end

end 