class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def create
    @user = User.new(:user => User.find(params[:id]), :firs_name => params[:firs_name], :last_name => params[:last_name], :description => params[:description], :email => params[:email], :age => params[:age], :city => params[:city]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @user.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to '/'
      flash[:success] = "Success"
    else
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
      flash[:error] = "Error"
      render :new
    end

  end

  def new
    @user = User.new

  end

  def edit
  end

  def show
  puts @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end

end
