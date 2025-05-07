class Admin::CustomersController < ApplicationController
  layout 'admin'

  def show
    @customer = Customer.find(params[:id])
  end

  def index
    @customers = Customer.page(params[:page])
  end

  def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
       flash[:success] = "ユーザーを削除しました。"
      redirect_to admin_dashboards_path
  end

end
