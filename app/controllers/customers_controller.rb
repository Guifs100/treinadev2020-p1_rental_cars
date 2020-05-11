class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def search
    # byebug
    # @customers = Customer.where(name: params[:q])

    # desse jeito o like fica safe, por causa que ? proteje que passa outros comandos e tome exploit
    # @customers = Customer.where('name LIKE ?', "%#{params[:q]}%")
    @customers = Customer.search(params[:q])
    render :index
  end
end