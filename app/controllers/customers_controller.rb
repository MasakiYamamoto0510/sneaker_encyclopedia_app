class CustomersController < ApplicationController
  def mypage
    @customer = current_customer
    @posts = @customer.posts
  end    

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
  end

  def edit
    @customer = current_customer
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end


  private 

  def customer_params
    params.require(:customer).permit(:name, :self_introduction, :image)
  end

end
