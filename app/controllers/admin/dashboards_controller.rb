class Admin::DashboardsController < ApplicationController
  layout 'admin'
  def sneaker
   @sneaker_brands = SneakerBrand.all
  end

  def index
      @customers = Customer.all
      @sneakers = Sneaker.all
  end
end
