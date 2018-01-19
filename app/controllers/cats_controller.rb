class CatsController < ApplicationController
  def new
    @title = "Inscription"
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
    @titre = @cat.name
  end

  def create
    @cat = Cat.new cat_params
    if @cat.save
      flash[:success] = "Bienvenue dans l'Application Exemple!"
      session[:cat_id] = @cat.id
      redirect_to @cat
    else
      @titre = "Inscription"
      render 'new'
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :email, :password, :password_confirmation)
  end
end
