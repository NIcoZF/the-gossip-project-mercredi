class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], description: params[:description], email: params[:email], age: params[:age], password: params[:password], city_id: City.all.sample.id)
    if @user.save
      flash[:success] = "Inscription réussie ! Let the Gossip begin..."
      session[:user_id] = @user.id
      redirect_to root_path
      #puts session[:user_id] afficher l'id de l'utilisateur connecté
    else
      flash[:error] = "Il y a une erreur quelque part. Réessaye !"
      render 'new'
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end


end
