class Admin::DashboardsController < ApplicationController
  layout 'admin'
 
 
    def index
        @customers = Customer.all
    end
end
