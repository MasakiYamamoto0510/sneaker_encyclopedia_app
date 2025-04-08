class Public::SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]

    if @model == "sneaker"
      @records = Sneaker.search_for(@content, @method)
    end
  end 
  
end
