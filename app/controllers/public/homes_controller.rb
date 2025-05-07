class Public::HomesController < ApplicationController
  def top
  end

  def about
    @admins = Admin.page(params[:admins_page])
    @customers = Customer.where(is_active: true)
                         .order(point: :desc)
                         .page(params[:customers_page])
  end
end
