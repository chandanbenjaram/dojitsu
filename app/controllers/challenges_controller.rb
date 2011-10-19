class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
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
    #session[:challenge_params] ||={}
    #@challenge = Challenge.new(session[:challenge_params])
    #@challenge.current_step = session[:form_step]
    #1.times {@challenge.tasks.build}
  end

  def create
    #raise params.to_yaml
    #raise dateStart.inspect
    session[:challenge_params].deep_merge!(params[:challenge]) if params[:challenge]
    @challenge = Challenge.new(session[:challenge_params])
    @challenge.current_step = session[:form_step]
    if @challenge.valid?
      if params[:previous_button]
        @challenge.previous_step
      elsif @challenge.last_step?
        @challenge.save  
      else
        @challenge.next_step
      end
      session[:form_step] = @challenge.current_step
    end
    if @challenge.new_record?
       render 'new'
    else
       session[:form_step] = session[:challenge_params] = nil
       flash[:notice] = "Challenge Created"
       redirect_to @challenge
    end
    #@challenge = Challenge.create!(params[:challenge]) do |doc|  
      #doc.user_id = current_user.id
    #end      
    #redirect_to  :action => "show", :notice => "Challenge created!"   
  end

  def edit
  	#raise params.inspect
    @challenge = Challenge.find(params[:id])
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
  
  def add_task
    #raise params.to_yaml
    @tsk_id = params[:id]
    @challenge = Challenge.find(params[:id])
  end
  
  def update_task
    raise params.to_yaml
  end
  
  def pravin
    #raise params.to_yaml
    @all_data = params[:challenge]
    #raise @all_data.title.inspect
    #raise params[:title].inspect
    @title = params[:challenge][:title]
    @description = params[:challenge][:description]
    @dateStart = params[:challenge][:dateStart]
    @dateEnd = params[:challenge][:dateEnd]
    @discipline = params[:challenge][:discipline]
    @participants = params[:challenge][:participants]
    @challenge = Challenge.new
    render  add_task_challenges_path
  end
    
  protected
  
  def find_challenge
    @challenge = Challenge.find(params[:id]);
  end
  
end

