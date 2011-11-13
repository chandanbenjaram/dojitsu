class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  #on_spot_edit  is the gem to edit the data on spot 
  can_edit_on_the_spot
  
  def index
    @title = "Challenges"
    @no_of_row = Challenge.all.count
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
      
      #@challenge.task_attributes.each do |tsk|
      #  raise tsk.name.inspect
      #end
      
      
      #@challenge.task_attributes.each do |ts|
      #  ts.each do |sd|
      #    raise sd[4].inspect
      #  end
      #end

      #@challenge.social_type.type  
      #if @challenge.social_challenge.type and @challenge.social_challenge.type!='0' and @challenge.social_challenge.type!=nil 
      ch = @challenge.social_type.type 
      #render :text => ch and return
      if ch == ChallengeSocialType and ch!= ChallengeType and ch!=ChallengePersonalType
        render "show_soc" and return 
      else 
      render "show_per"
    end
  end
  
  def new
    @challenge = Challenge.new
    1.times {@challenge.tasks.build} 
    #1.times {@challenge.point_types.build}
  end

  def create
    debugger
    #raise params.inspect
    #INVITEE USER ID
    @user_id = ["sriram@gmail.com","venkat@gmail.com","Suresh@gmail.com","sukendhar@gmail.com"]
    
    @ch = Challenge.new(params[:challenge])
    @ch_st_date = params[:ch_st_date]
    @st_p_val1 = params[:st_value1]
    @st_p_val = params[:st_value]
    @st_p_leb = params[:st_label]
    
    @ch_ed_date = params[:ch_ed_date]
    @ed_p_val1 = params[:ed_value1]
    @ed_p_val = params[:ed_value]
    @ed_p_leb = params[:ed_label]
    
    @so_who_win = params[:soc_who_win]
    @so_how_many_winner = params[:soc_how_many_winner]
    @pr_who_win = params[:per_who_win]
    
    unless @so_who_win.blank?
      #raise "soc"
      if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
        @challenge = Challenge.new(:user_id => current_user.id, :title => @ch.title, :description => @ch.description, :task_attributes => @ch.task_attributes, \
          :start_point => PointDateType.new(:value => @st_p_val1), \
          :end_point => PointDateType.new(:value => @ed_p_val1), \
          :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner))
      else
        @challenge = Challenge.new(:user_id => current_user.id, :title => @ch.title, :description => @ch.description, :task_attributes => @ch.task_attributes, \
          :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
          :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
          :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner))
      end
    else
      #raise "per"
      if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
        @challenge = Challenge.new(:user_id => current_user.id, :title => @ch.title, :description => @ch.description, :task_attributes => @ch.task_attributes, \
          :start_point => PointDateType.new(:value => @st_p_val1), \
          :end_point => PointDateType.new(:value => @ed_p_val1), \
          :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win))
      else
        @challenge = Challenge.new(:user_id => current_user.id, :title => @ch.title, :description => @ch.description, :task_attributes => @ch.task_attributes, \
          :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
          :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
          :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win))
      end
    end
     
   @user_id.each do |userid|
      @challenge.child_challenges.build(:user_id => userid, :title => @ch.title, :description => @ch.description, :task_attributes => @ch.task_attributes, \
          :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
          :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
          :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win))
   end
    @challenge.save!
    redirect_to :action => "index", :notice => "Challenge created!"   
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
  
  def invite_frd
    @invitor_email = "pravin@gmail.com"
    @invitee_challenge_id = "4eb992f2af812d03000000b5"
    @invitee_email = ["sriram@gmail.com","venkat@gmail.com","Suresh@gmail.com","sukendhar@gmail.com"]
    @invitee_first_name = ["Sri Ram","Venkat","Suresh","Sukendhar"]
    @invitee_last_name = ["Kappor","Patlola","Mahadevan","Reddy"]
    @status = ["ACCEPTED","PENDING","ACCEPTED","DECLINED"]
    
    @flag_fn = 0
    @flag_ln = 0
    @new_fn = []
    @new_ln = []
    #@id = "4eb922487c1bd8085c000053"
    #@challenge_copy = Challenge.find(@id)
    #@challenge_invitee = ChallengeInvitation.create(:invitee_challenge_id=>@invitee_challenge_id, :invitor_email=>@invitor_email, :invitees =>[Invitee.new(:invitee_email=>"sriram@gmail.com", :invitee_first_name=>"Sri ram", :invitee_last_name=>"Kapoor", :status =>"Accepted", :challenge=>Challenge.new(:title=>"ch001",:description=>"ch001 task is testing challenge")), Invitee.new(:invitee_email=>"venkat@gmail.com", :invitee_first_name=>"Venkat", :invitee_last_name=>"Reddy", :status =>"Pending")])
    
    @challenge_invitee = ChallengeInvitation.create(:invitee_challenge_id=>@invitee_challenge_id, :invitor_email=>@invitor_email)
    
    #@challenge_invitee.invitees.push([Invitee.new(:invitee_email =>"sriram@gmail.com")])
    @invitee_email.each_with_index do |in_email,em_index|
      @invitee_first_name.each_with_index do |in_fname,fn_index|
        @invitee_last_name.each_with_index do |in_lname,ln_index|
          if @flag_ln == ln_index
            @flag_ln+=1
            @new_ln[ln_index] = in_lname
            break
          end
        end  
        if @flag_fn == fn_index
          @flag_fn+=1
          @new_fn[fn_index] = in_fname
          break
        end
      end
      @challenge_invitee.invitees.push([Invitee.new(:invitee_email =>in_email, \
        :invitee_first_name =>@new_fn[em_index], :invitee_last_name => @new_ln[em_index], :challenge=>Challenge.find(@invitee_challenge_id) )])
    end
    
    #APPEND CHALLGENG TO INVITEE WHO ACCEPTED REQUEST
    #@id = "4eb922487c1bd8085c000053" 
    #@challenge_copy = Challenge.find(@id)
    #@challenge_invitee.invitees.push(:challenge=>[Challenge.new(:title =>"as")])
    #@status.each_with_index do |st_value, st_index|
    #  if st_value == "ACCEPTED"
    #    #raise Challenge.find(@id).inspect
    #    @challenge_invitee.invitees.push([Challenge.find(@id)]) 
    #  else
    #    raise "not works!!!!!!!!!!!"
    #  end
    #end
    
    raise "CHECK DATABASE TABE 'challenge_invitations' for data"
  end
  
  def invitee_accepted_req
    raise "aaaaaaaaa"
  end
  
  def challenge_comp
    #Challenge.where(:_id => "4ebe067b7c1bd8023800006d").update(:is_complete => 1)
    #@id =params[:id]
    #raise @sdf = Challenge.update_attribute(:is_complete => 1).where(:id => @id).inspect
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
      
  protected
  
  def find_challenge
    @challenge = Challenge.all
  end
  
end

