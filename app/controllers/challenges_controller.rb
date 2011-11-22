class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  #on_spot_edit  is the gem to edit the data on spot 
  can_edit_on_the_spot

  def index
    @title = "Challenges"
    @no_of_row = Challenge.all.count
    @challenges = current_user.challenges
  end

  def show       
    @challenge = Challenge.find(params[:id])	
  end

  def show_soc
    @challenge = Challenge.find(params[:id])
    @org = User.find(:all,:conditions => ["id=?",@challenge.user_id]).first
  end

  def show_per
    @challenge = Challenge.find(params[:id])
    
    if (@challenge.social_type.instance_of? ChallengeSocialType rescue false)
      render "show_soc" and return 
    else 
      render "show_per"
    end
  end

  def new
    @challenge = Challenge.new
    1.times {@challenge.tasks.build} 
  end

  def create
	#raise params.inspect
    #debugger
    #raise params[:invitees].inspect
    @ch = Challenge.new(params[:challenge])
    #raise @ch.id.inspect
    @ch_st_date = params[:start_point_type]
    @st_p_val1 = params[:st_value1]
    @st_p_val = params[:st_value]
    @st_p_leb = params[:st_label]

    @ch_ed_date = params[:end_point_type]
    @ed_p_val1 = params[:ed_value1]
    @ed_p_val = params[:ed_value]
    @ed_p_leb = params[:ed_label]

    @so_who_win = params[:soc_who_win]
    @so_how_many_winner = params[:soc_how_many_winner]
    @pr_who_win = params[:per_who_win]

    unless @so_who_win.blank?
      #raise "soc"
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, \
      :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner)) do |new_challenge|
        if @ch_st_date == "startPointDate" and  @ch_ed_date == "endPointDate"
          new_challenge.start_point =  PointDateType.new(:value => @st_p_val1)
          new_challenge.end_point = PointDateType.new(:value => @ed_p_val1) 
        else
          new_challenge.start_point =  PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb)
          new_challenge.end_point = PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb) 
        end

        if !params[:invitees].nil?
          params[:invitees].split(",").each do |invitee|
            if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
              new_challenge.child_challenges.build(:user_id => invitee, :title => @ch.title, :description => @ch.description, \
              :start_point => PointDateType.new(:value => @st_p_val1), \
              :end_point => PointDateType.new(:value => @ed_p_val1), \
              :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win), \
              :tasks => @ch.task_attributes)
            else 
              new_challenge.child_challenges.build(:user_id => invitee, :title => @ch.title, :description => @ch.description, \
              :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
              :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
              :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win), \
              :tasks => @ch.task_attributes)
            end
          
          end      
        end        
      end
    else
      #raise "per"
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, \
      :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win)) do |new_challenge|
        if @ch_st_date == "startPointDate" and  @ch_ed_date == "endPointDate"
          new_challenge.start_point =  PointDateType.new(:value => @st_p_val1)
          new_challenge.end_point = PointDateType.new(:value => @ed_p_val1) 
        else
          new_challenge.start_point =  PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb)
          new_challenge.end_point = PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb) 
        end
      end            
    end

    @ch.task_attributes.each do |task_attr|
      @challenge.tasks.build(task_attr)
    end

    @challenge.save!
    redirect_to :action => "index", :notice => "Challenge created!"   
  end

  def edit
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

  def invitee_accepted_req
    raise "aaaaaaaaa"
  end
  
  def message
	render :partial => 'challenges/message'
  end  
	  
  def task_update
    @id = params[:id]
    @name = params[:name]
	@score = params[:score]
	@score_by = params[:score_by]
    render :layout => false
  end
  
  def task_update_c
	#raise params.inspect
	@ch_ts_update = Challenge.find(params[:id])
	unless params[:tatal_s]
		@ch_ts_update.tasks.where(:name => params[:name]).update(:is_complete => 1)
	else
		@ch_ts_update.tasks.where(:name => params[:name]).update(:is_complete => 1, :score => params[:tatal_s])
	end 
	redirect_to show_per_challenges_path(:id => params[:id])
  end

  def challenge_comp
	  @sdf = Challenge.where(:_id => params[:id]).update(:is_complete => 1)
	  redirect_to :action => "index"
  end

  def my_challenge
    @my_total_challenge = Challenge.all.count
    @my_all_ch = Challenge.all
    @my_all_ch.each do |sd|
      @org = User.find(:all,:conditions =>["id = ?",sd.user_id]).first
    end
  end
  
  def add_task_link
    @ch_id = params[:id]
    render :layout => false
  end
  
  def add_task_fun
    @chall_ref = Challenge.find(params[:challenge_id]) 
    @chall_ref.tasks.push(Task.new(:name => params[:name], :score => params[:score], :score_by => params[:score_by]))
    #@chall_ref.child_challenges.build(:tasks => Task.new(:name => params[:name], :score => params[:score], :score_by => params[:score_by]))
    redirect_to show_per_challenges_path(:id => params[:challenge_id])
  end
  
  def date_update
	@challenge_date = Challenge.find(params[:id])
	@date = @challenge_date.end_point.value 
	render :layout => false
  end

  protected

  def find_challenge
    @challenge = Challenge.all
  end

  
  
end

