class GossipsController < ApplicationController
  before_action :logged_in_user, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @gossips = Gossip.all
  end

  def create
    @gossip = Gossip.new(:user => User.find(10), :title => params[:title], :content => params[:content]) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
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
    @gossip = Gossip.new

  end

  def edit
  end

  def show
    @gossip = Gossip.find(params[:id])
    @user = Gossip.find(params[:id]).user
  end

  def update
  end

  def destroy
  end

  private
          # Confirms a logged-in user
        def logged_in_user
            unless logged_in?
            store_location
            flash[:danger] = "Please log in!"
            redirect_to login_path
            end
        end

        # Confirms the correct user
        def correct_user
            @post = Post.find(params[:id])
            user = @post.user
            redirect_to(root_url) unless (current_user?(user) || current_user.admin?)
        end

end
