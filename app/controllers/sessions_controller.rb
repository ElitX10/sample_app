class SessionsController < ApplicationController
  def new
    @titre = "S'identifier"
  end

  def create
    user = Cat.authenticate(params[:sessions][:email],
                            params[:sessions][:password])
    if user.nil?
      flash.now[:error] = "Combinaison Email/Mot de passe invalide." + params[:sessions][:email].to_s + ", " + params[:sessions][:password].to_s
      @titre = "S'identifier"
      render 'new'
    else

    end
  end

  def destroy
  end
end
