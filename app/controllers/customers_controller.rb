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
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path(current_customer.id)
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    #flash[:notice] = "退会処理を実行しました"
    redirect_to  new_customer_registration_path
  end


  private 

  def customer_params
    params.require(:customer).permit(:name, :self_introduction, :image)
  end

end
