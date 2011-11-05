class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  can_edit_on_the_spot
  def index
    @title = "Challenges"
    @challenges = Challenge.all
  end

  def show
  
    @challenge = Challenge.find(params[:id])
  end
  
  def show_soc
    @challenge = Challenge.find(params[:id])
    @org = User.find(:all,:conditions => ["id=?",@challenge.user_id]).first
    @lists = List.all
  end

  def show_per
      @challenge = Challenge.find(params[:id])
	 if @challenge.per_who_win? && @challenge.per_who_win!= nil && @challenge.per_who_win!='0'

      render "show_per" and return 
   else
      render "show_soc"
    end
  end
  
  def new
    @challenge = Challenge.new
    #1.times {@challenge.tasks.build}
    1.times {@challenge.point_types.build}
  end

  def create
    #raise params.to_yaml
    #raise dateStart.inspect
    @challenge = Challenge.create!(params[:challenge]) do |doc|  
      doc.user_id = current_user.id
    end      
    render  :action => "show", :notice => "Challenge created!"   
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
  
  def my_challenge
    @my_all_ch = Challenge.all
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
  
  def test
    render :layout => false
  end
    
  protected
  
  def find_challenge
    @challenge = Challenge.all
  end
  
end