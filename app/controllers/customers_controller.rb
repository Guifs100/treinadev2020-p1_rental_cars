class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def search
    # byebug
    @customers = Customer.where(name: params[:q])
    # @customers = Customer.where("first_name LIKE ?", "%#{params[:q]}%")
    # @customers = Customer.search(params[:q])
    render :index
  end
end