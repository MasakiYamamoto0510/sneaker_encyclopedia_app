class Admin::CustomersController < ApplicationController
  layout 'admin'

  def index
    @customers = Customer.all
  end

  def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
      redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
  end
end
