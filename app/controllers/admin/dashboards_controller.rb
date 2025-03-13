class Admin::DashboardsController < ApplicationController
  layout 'admin'
 
 
    def index
        @customers = Customer.all
        @sneakers = Sneaker.all
    end
end
