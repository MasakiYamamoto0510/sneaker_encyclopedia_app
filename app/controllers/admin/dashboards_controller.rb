class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
 
    def index
        @customers = Customer.all
    end
end
