class CatsController < ApplicationController
  def new
    @title = "Inscription"
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
