class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
    
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
    @challenge = Challenge.create!(params[:challenge])
    redirect_to @challenge, :notice => "Challenge created!"
  end

  def edit
    @challenge = Challenge.find(params[:id])
  end   

  def update
    @challenge = Challenge.find(params[:id])
    if @challenge.update_attributes(params[:challenge])
      redirect_to :action => 'show', :id => @challenge
    else
      render :action => edit
    end
  end

  def destroy
    Challenge.find(params[:id]).destroy
    redirect_to :action => 'index'
  end   

end

