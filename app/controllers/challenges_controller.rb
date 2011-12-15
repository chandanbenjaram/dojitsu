class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:nonLoginShowPersonal, :nonLoginShowSocial, :nonLoginIndex]
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
    @flg = params[:flg]
    @challenge = Challenge.find(params[:id])
    @is_complete_status = 0 
    @challenge.tasks.each do |checkingTaskStatus|
      unless checkingTaskStatus.is_complete == 1
        @is_complete_status = 1
        next
      end
    end
    if @is_complete_status == 0
      Challenge.where(:_id => params[:id]).update(:is_complete => 1)
    end
    @org = User.find(:all,:conditions => ["id=?",@challenge.user_id]).first
  end

  def show_per
    @challenge = Challenge.find(params[:id])
	
    @is_complete_status = 0 
    @challenge.tasks.each do |checkingTaskStatus|
      unless checkingTaskStatus.is_complete == 1
        @is_complete_status = 1
        next
      end
    end
    if @is_complete_status == 0
      Challenge.where(:_id => params[:id]).update(:is_complete => 1)
    end
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
    
    @ch = Challenge.new(params[:challenge])
    @ch_st_date = params[:start_point_type]
    @st_p_val = params[:start_point_value]
    @st_p_leb = params[:start_point_label]

    @ch_ed_date = params[:end_point_type]
    @ed_p_val = params[:end_point_value]
    @ed_p_leb = params[:end_point_label]

    @so_who_win = params[:soc_who_win]
    @so_how_many_winner = params[:soc_how_many_winner]
    @pr_who_win = params[:per_who_win]

    unless @so_who_win.blank?
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, :canCompleteBeforeTasks => @ch.canCompleteBeforeTasks, \
      :social_type => ChallengeSocialType.new(:status => 1,:who_win => @so_who_win, :how_many_winners => @so_how_many_winner)) do |new_challenge|
        if @ch_st_date == "startPointDate" and  @ch_ed_date == "endPointDate"
          new_challenge.start_point =  PointDateType.new(:value => Date.strptime(@st_p_val, '%m/%d/%Y'))
          new_challenge.end_point = PointDateType.new(:value => Date.strptime(@ed_p_val, '%m/%d/%Y')) 
        else
          new_challenge.start_point =  PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb)
          new_challenge.end_point = PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb) 
        end
      end
    else
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, :canCompleteBeforeTasks => @ch.canCompleteBeforeTasks, \
      :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win)) do |new_challenge|
        if @ch_st_date == "startPointDate" and  @ch_ed_date == "endPointDate" 
          new_challenge.start_point =  PointDateType.new(:value => Date.strptime(@st_p_val, '%m/%d/%Y'))
          new_challenge.end_point = PointDateType.new(:value => Date.strptime(@ed_p_val, '%m/%d/%Y')) 
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
	
	unless @so_who_win.blank?
		# referenced documents can only be saved when parent exists
		if !params[:invitees].nil?
			params[:invitees].split(",").each do |aFBId|
				current_user.user_connections.find_or_create_by_target_id(:target_id => aFBId )
			end
		end
	end
		

    unless @so_who_win.blank?
      # referenced documents can only be saved when parent exists
      if !params[:invitees].nil?
        params[:invitees].split(",").each do |invitee|
          if @ch_st_date == "startPointDate" and  @ch_ed_date == "endPointDate"
            @challenge.child_challenges.create!(:user_id => invitee, :title => @ch.title, :description => @ch.description, :canCompleteBeforeTasks => @ch.canCompleteBeforeTasks, \
            :start_point => PointDateType.new(:value => Date.strptime(@st_p_val, '%m/%d/%Y')), \
            :end_point => PointDateType.new(:value => Date.strptime(@ed_p_val, '%m/%d/%Y')), \
            :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner), \
            :tasks => @ch.task_attributes)
          else 
            @challenge.child_challenges.create!(:user_id => invitee, :title => @ch.title, :description => @ch.description, :canCompleteBeforeTasks => @ch.canCompleteBeforeTasks, \
            :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
            :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
            :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner), \
            :tasks => @ch.task_attributes)
          end
        end      
      end  
    end    

    redirect_to show_per_challenges_path(:id => @challenge), :notice => "Challenge created!"

  end

  def edit
    @challenge = Challenge.find(params[:id])
  end

  def update_task_soc
    @challenge = Challenge.find(params[:id])
    Challenge.where(:_id => params[:id]).update(:canCompleteBeforeTasks => params[:challenge][:canCompleteBeforeTasks])
    @challenge.tasks.destroy
    @challenge.child_challenges.each do |eachChildChallenge|
      eachChildChallenge.update_attributes(:canCompleteBeforeTasks => params[:challenge][:canCompleteBeforeTasks])
      eachChildChallenge.tasks.destroy
      eachChildChallenge.update_attributes(params[:challenge])
    end
    @challenge.update_attributes(params[:challenge])
    redirect_to show_soc_challenges_path(:id => @challenge)
  end

  def update
    @challenge = Challenge.find(params[:id])
	
    if @challenge.update_attributes(params[:challenge])
      redirect_to :action => 'index', :id => @challenge
    else
      render :action => edit
    end
  end
	
  def date_update
  	raise "venkat..."
    @challenge = Challenge.find(params[:id])
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
    @chall_ref.child_challenges.each do |ts|
      ts.tasks.push(Task.new(:name => params[:name], :score => params[:score], :score_by => params[:score_by]))
    end
    redirect_to show_per_challenges_path(:id => params[:challenge_id])
  end

  def date_update
   @challenge = Challenge.find(params[:id]) 
   raise @challenge.inspect
  end

  def update_status
    aChallenge = Challenge.find(params[:id])
    socialType = aChallenge.social_type
    socialType.update_attributes(:status => params[:status])       

	
    redirect_to show_soc_challenges_path(:id => params[:id])
  end

  def update_status_af_meg
    Challenge.where(:_id => params[:thinking_abt] ).all.each do |aChallenge|
      aChallenge.child_challenges.each do |aChildChallenge|
        socialType = aChildChallenge.social_type
        socialType.update_attributes(:status => "null")
      end
    end
  end
  
  def paginationTest
    #@challegnes = Challenge.where(:_type.exists => false)
    #@users = Challenge.paginate(:page => params[:page])
    # or, use an explicit "per page" limit:
    #@users = @challegnes.paginate(:page => params[:page], :per_page => 1)
    @users = UserConnection.paginate(:per_page=>2, :page=>params[:page])
    #@users = Message.paginate(:conditions=>{:to => '100002573213371'},:per_page=>2, :page=>params[:page])
    #@users = Challenge.where(:_type.exists => false).paginate(:page =>params[:page], :per_page => 1)
  end
  
  def nonLoginShowPersonal
    @challenge = Challenge.find(params[:id])
    if(@challenge.social_type.instance_of? ChallengeSocialType rescue false)
      render "nonLoginShowSocial" and return
    else
      render "nonLoginShowPersonal"
    end
  end
  
  def nonLoginShowSocial
    @challenge = Challenge.find(params[:id])
  end
  
  def nonLoginIndex
    @challenges = Challenge.where(:_type.exists => false).desc("created_at")
  end
  
  def socialPeople
    render :layout => false
  end

  protected

  def find_challenge
    @challenge = Challenge.all
  end
  
end

