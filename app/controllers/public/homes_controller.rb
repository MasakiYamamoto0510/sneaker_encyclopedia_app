class Public::HomesController < ApplicationController
  def top
  end

  def about
    @admins = Admin.all
  end
end
