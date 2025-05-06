class Public::HomesController < ApplicationController
  def top
  end

  def about
    @admins = Admin.all
    @customers = Customer.where(is_active: true).order(point: :desc)
  end
end
