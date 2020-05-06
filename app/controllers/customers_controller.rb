class CustomerController < ApplicationControler
  def index
    @customers = Customer.all
  end

  def search
    @customers = Customer.where(name: params[:q])
    render :index
  end
end