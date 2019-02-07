class SessionsController < ApplicationController

  def new
  end

  def create
  # cherche s'il existe un utilisateur en base avec l’e-mail
  user = User.find_by(email: params[:email])
  # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Vous êtes connecté"
      redirect_to root_path
      # redirige où tu veux, avec un flash ou pas
    else
      flash.now[:error] = 'Login ou mot de passe incorrect...'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:alert] = "Vous êtes déconnecté"
    redirect_to root_path
  end

end
