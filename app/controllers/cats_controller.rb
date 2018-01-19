class CatsController < ApplicationController
  before_action :authenticate, :only => [:edit, :update]
  before_action :correct_user, :only => [:edit, :update]
  include SessionsHelper, ApplicationHelper

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

  def index
    @titre = "Tous les utilisateurs"
    @cats = Cat.page(params[:page]).per(10)
  end

  private

  def authenticate
    deny_access unless signed_in?
  end

  def correct_user
    @cat = Cat.find(params[:id])
    redirect_to(root_path , :notice => "Vous n'avez pas les droits de modifications sur cette utilisateur.") unless current_user?(@cat)
  end

  def cat_params
    params.require(:cat).permit(:name, :email, :password, :password_confirmation)
  end
end
