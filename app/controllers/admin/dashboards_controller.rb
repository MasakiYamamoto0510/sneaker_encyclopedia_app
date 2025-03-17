class Admin::DashboardsController < ApplicationController
  layout 'admin'
 
 
    def index
        @customers = Customer.all
        @sneakers = Sneaker.where(is_publish: true)
        @unpublished_sneakers = Sneaker.where(is_publish: false)
    end
end
