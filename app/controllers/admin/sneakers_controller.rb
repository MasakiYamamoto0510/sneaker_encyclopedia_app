class Admin::SneakersController < ApplicationController
  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    #@sneaker.admin_id = current_admin.id
    @sneaker.save
    redirect_to admin_sneaker_path(@sneaker.id)
  end

  def index
  end

  def show
  end

  private

  def sneaker_params 
    params.require(:sneaker).permit(:image, :brand_id, :sneaker_name, :overview, :year_of_manufacture, :color, :size_sex, :size_country, :numerical_size)
  end

end
