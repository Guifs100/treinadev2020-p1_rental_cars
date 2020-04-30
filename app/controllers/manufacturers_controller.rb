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

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  # PATCH ou PUT
  def update
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.update(manufacturer_params)
    redirect_to @manufacturer
  end

  private
  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end