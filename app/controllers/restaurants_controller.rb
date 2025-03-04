class RestaurantsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :generate_qr_code]

  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result.includes(:user)
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.new
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, notice: 'Restaurant was successfully added.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: 'Restaurant was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: 'Restaurant was successfully deleted.'
  end

  def generate_qr_code
    # Create or update QR code for this restaurant
    if @restaurant.qr_code.present?
      qr_code = @restaurant.qr_code
    else
      qr_code = current_user.qr_codes.new
      qr_code.linkable = @restaurant
    end

    qr_code.title = "#{@restaurant.name} QR Code"
    qr_code.url = restaurant_url(@restaurant)
    qr_code.description = "QR code for #{@restaurant.name}"
    qr_code.active = true

    if qr_code.save
      redirect_to qr_code_path(qr_code), notice: 'QR code was successfully generated.'
    else
      redirect_to @restaurant, alert: 'Failed to generate QR code.'
    end
  end

  private

  def set_restaurant
    @restaurant = params[:user_id] ? User.find(params[:user_id]).restaurants.find(params[:id]) : Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :address, :phone, :website, :category, :price_level, :image)
  end
end
