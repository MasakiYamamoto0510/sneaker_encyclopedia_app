class Admin::CustomersController < ApplicationController
  layout 'admin'

  def index
    @customers = Customer.all
  end

  def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
       flash[:success] = "ユーザーを削除しました。"
      redirect_to admin_dashboards_path
  end

end
