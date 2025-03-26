class Public::SneakerTypesController < ApplicationController
  def index
    @sneaker_types = SneakerType.all
  end
end
