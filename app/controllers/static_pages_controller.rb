class StaticPagesController < ApplicationController
=begin  
  def welcome
    @gossips = Gossip.all
  end
=end
  
  def team
  end

  def contact
  end

=begin 
  def gossipdetails
    @gossip = Gossip.find(params[:id])
    @user = Gossip.find(params[:id]).user
  end
=end

  def authordetails
    @user = User.find(params[:id])
  end

end

