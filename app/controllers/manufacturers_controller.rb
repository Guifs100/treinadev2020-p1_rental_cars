class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = 'Fabricante criado com sucesso'
      redirect_to @manufacturer
    else
      render new_manufacturer_path
    end
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end