class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]

  def mypage
    @customer = current_customer
    @posts = @customer.posts
    @favorites = @customer.favorites
    @sneaker_comments = @customer.sneaker_comments
    @sneaker_comment_favorites = @customer.sneaker_comment_favorites
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
      flash[:success] = "更新に成功しました。"
      redirect_to customer_path(current_customer.id)
    else
      flash.now[:danger] = "更新に失敗しました。"
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
    flash[:success] = "退会処理を実行しました"
    redirect_to  new_customer_registration_path
  end


  private 

  def customer_params
    params.require(:customer).permit(:name, :email, :password, :self_introduction, :profile_image)
  end

  def is_matching_login_customer
    unless current_customer
      redirect_to mypage_path
    end
  end

end
