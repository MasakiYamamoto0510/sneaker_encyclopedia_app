class Public::HomesController < ApplicationController
  def top
  end

  def about
    @admins = Admin.all
    @customers = Customer.all.sort_by { |c| c.point }.reverse
  end
end
