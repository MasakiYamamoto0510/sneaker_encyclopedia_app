class Admin::SearchesController < ApplicationController
layout 'admin'

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    sort_param = params[:sort]

    if @model == "sneaker"
      @records = Sneaker.search_for(@content, @method)
      case sort_param
      when "latest"
        @records = @records.latest
      when "old"
        @records = @records.old
      else
        @records = @records.latest
      end
    elsif @model == "sneaker_brand"
      @records = SneakerBrand.search_for(@content, @method)
    elsif @model == "sneaker_type"
      @records = SneakerType.search_for(@content, @method)
    else
      @records = Customer.search_for(@content, @method)
    end
  end 
end
