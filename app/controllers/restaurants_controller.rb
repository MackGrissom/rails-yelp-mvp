class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]


    def index
      @restaurants = Restaurant.all
    end
  
  
    def show
    end
  
    def new
      @restaurant = Restaurant.new
    end
  
    def create
      @restaurant = Restaurant.new(restaurant_params)
      if @restaurant.save
        redirect_to restaurant_path(@restaurant)
      else
        render :new
      end
    end

    # def create
    #     @restaurant = Restaurant.new(restaurant_params)
    
    #     respond_to do |format|
    #       if @restaurant.save
    #         format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
    #         format.json { render :show, status: :created, location: @restaurant }
    #       else
    #         format.html { render :new, status: :unprocessable_entity }
    #         format.json { render json: @restaurant.errors, status: :unprocessable_entity }
    #       end
    #     end
    #   end
  
    def edit
    end
  
  
    def update
      if @restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
      else
        render :edit
      end
    end
  
  
    def destroy
      if @restaurant.destroy
        redirect_to restaurants_path
      end
    end
  
    private
  
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
  
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
      # {"name"=>"ugarit", "address"=>"asda", "rating"=>"5"}
    end
end
