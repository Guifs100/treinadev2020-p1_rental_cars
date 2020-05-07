class CarRentalController < ApplicationController

  def new
    @rental = Rental.find(params[:rental_id])
    @car_rental = CarRental.new
    @cars =  @rental.car_category.cars
  end

  def create
    @rental = Rental.find(params[:rental_id])
    @car_rental = CarRental.new(params.require(:car_rental).permit(:car_id))
    # @car_rental.user = 
  end

end