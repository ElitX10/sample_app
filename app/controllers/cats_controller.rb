class CatsController < ApplicationController
  def new
    @title = "Inscription"
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
    @titre = @cat.name
  end
end
