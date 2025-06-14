class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update]
  before_action :ensure_guest_customer, only: [:edit]

  def mypage
    @customer = current_customer
    @posts = @customer.posts
                      .order(created_at: :desc)
                      .page(params[:posts_page])
    @favorites = @customer.favorites
                          .order(created_at: :desc)
                          .page(params[:favorites_page])
    @sneaker_comments = @customer.sneaker_comments
                                 .order(created_at: :desc)
                                 .page(params[:sneaker_comments_page])
    @sneaker_comment_favorites = @customer.sneaker_comment_favorites
                                          .order(created_at: :desc)
                                          .page(params[:sneaker_comment_favorites_page])
  end    

  def show
    @customer = Customer.find(params[:id])
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

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.guest_customer?
      flash[:danger] = "ゲストはプロフィール編集画面へ遷移できません。"
      redirect_to customer_path(current_customer) 
    end
  end  
end

