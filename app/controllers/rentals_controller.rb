class RentalsController < ActiveController
  def show
  end

  def new
  end

  def create
    @rental = Rental.create(params.require(:rental).permit(:start_date,
                                           :end_date,
                                           :customer_id
                                           :car_category_id))
    redirect_to rentals_path
  end

  def search
    @q = params[:q]
    @rental = Rental.find_by(code: params[:q].upcase)
    # if @rental.blank? || params[:q].blank?
    #   @rentals = Rental.all
    #   flash.now[:alert] = "Nenhum resultado encontrado para: #{params[:q]}"
    #   render :index
    # end
  end
end