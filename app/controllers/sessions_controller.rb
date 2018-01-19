class SessionsController < ApplicationController
  include SessionsHelper

  def new
    @titre = "S'identifier"
  end

  def create
    user = Cat.authenticate(params[:sessions][:email],
                            params[:sessions][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Email/Mot de passe invalide."
      @titre = "S'identifier"
      render 'new'
    else
      session[:cat_id] = user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_back_or user
    end
  end

  def destroy
    flash[:info] = "Vous êtes maintenant déconnecté"
    session[:cat_id] = nil
    redirect_to root_path
  end
end
