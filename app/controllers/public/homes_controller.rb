class Public::HomesController < ApplicationController
  def top
  end

  def about
    @admins = Admin.page(params[:admins_page])
 
    customers = Customer.where(is_active: true).to_a
    sorted_customers = customers.sort_by(&:point).reverse
    @customers = Kaminari
                   .paginate_array(sorted_customers)
                   .page(params[:customers_page])
  end
end
