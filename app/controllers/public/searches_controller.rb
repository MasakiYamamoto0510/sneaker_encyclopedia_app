class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "sneaker"
      @records = Sneaker.search_for(@content, @method)
    elsif @model == "sneaker_brand"
      @records = SneakerBrand.search_for(@content, @method)
    else 
      @records = SneakerType.search_for(@content, @method)
    end
  end 
  
end
