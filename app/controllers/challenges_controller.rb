class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
    
  def index
    @title = "Challenges"
    @challenges = Challenge.all;
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new                        
    @challenge = Challenge.new
    render :action => 'edit'
  end

  def create            
    @challenge = Challenge.create!(params[:challenge]) do |doc|  
      doc.user_id = current_user.id
    end

    redirect_to @challenge, :notice => "Challenge created!"   
  end

  def edit
    @challenge
  end   

  def update
    if @challenge.update_attributes(params[:challenge])
      redirect_to :action => 'show', :id => @challenge
    else
      render :action => edit
    end
  end

  def destroy
    @challenge.destroy
    redirect_to :action => 'index'
  end        
  
  protected
  
  def find_challenge
    @challenge = Challenge.find(params[:id]);
  end
  
end

