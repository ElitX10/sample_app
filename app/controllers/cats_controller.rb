class CatsController < ApplicationController
  def new
    @titre = "Inscription"
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

  def edit
    @titre = "Edition du profil"
    @cat = Cat.find(params[:id])
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      flash[:success] = "Profil actualisé."
      redirect_to @cat
    else
      @titre = "Edition du profil"
      render 'edit'
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :email, :password, :password_confirmation)
  end
end
