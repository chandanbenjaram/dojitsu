class ChallengesController < ApplicationController
  def index
    puts "urls... #{challenges_path}"    
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
    puts "create STARTS..."          
    @challenge = Challenge.new
    if @challenge.update_attributes(params[:challenge])
      redirect_to challenges_path
    else
      render :action => 'edit'
    end
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

=begin
        @post = Post.create params[:post]
        session[:person] = Person.authenticate(user_name, password)
=end

