class Public::CustomersController < ApplicationController
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
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to customer_path(current_customer.id)
    else
      flash.now[:alert] = "更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to  new_customer_registration_path
  end


  private 

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :self_introduction, :profile_image)
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      redirect_to mypage_path
    end
  end

end
