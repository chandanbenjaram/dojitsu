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
    #raise @challenge.soc.inspect
    if @challenge.soc == 1
      redirect_to :action => "show_soc", :id => params[:id] 
    else
      redirect_to :action => "show_per", :id => params[:id]
    end
  end
  
  def show_soc
    @challenge = Challenge.find(params[:id])
    @org = User.find(:all,:conditions => ["id=?",@challenge.user_id]).first
    @lists = List.all
  end

  def show_per
    @challenge = Challenge.find(params[:id])
  end
  
  def new
    @challenge = Challenge.new
    1.times {@challenge.tasks.build}
  end

  def create
    #raise params.to_yaml
    #raise params.to_yaml
    #raise dateStart.inspect
    #@challenge = Challenge.create!(:title => "c title 0", :start_point => PointDateType.new(:value => Time.now),:end_point => PointDateType.new(:value => Time.now))
    @ch = Challenge.new(params[:challenge])
    #raise task = Task.new(params[:tasks]).inspect
    
    #@tasks = Task.new(params[:tasks])
    
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
        @challenge = Challenge.create!(:title => @ch.title, :description => @ch.description, \
          :start_point => PointDateType.new(:value => @st_p_val1), \
          :end_point => PointDateType.new(:value => @ed_p_val1), \
          :social_challenge => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner))         
      else
        @challenge = Challenge.create!(:title => @ch.title, :description => @ch.description, \
          :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
          :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
          :social_challenge => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner))
      end
    else
      #raise "per"
      if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
        @challenge = Challenge.create!(:title => @ch.title, :description => @ch.description, \
          :start_point => PointDateType.new(:value => @st_p_val1), \
          :end_point => PointDateType.new(:value => @ed_p_val1), \
          :personal_challenge => ChallengePersonalType.new(:who_win => @pr_who_win))          
      else
        @challenge = Challenge.create!(:title => @ch.title, :description => @ch.description, \
          :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
          :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
          :personal_challenge => ChallengePersonalType.new(:who_win => @pr_who_win))      
      end
    end
    
    
    
    @challenge.tasks.push([Task.new(params[:tasks])])
    
    #raise "aaaaa"
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
  
  def invite_frd
    @invitor_email = "pravin@gmail.com"
    @invitee_challenge_id = "ch001"
    @invitee_email = ["sriram@gmail.com","venkat@gmail.com"]
    @invitee_first_name = ["Sri Ram","Venkat"]
    # INSERT DATA USING MODEL
    #@challenge_invitee = ChallengeInvitation.create(:invitee_challenge_id=>@invitee_challenge_id, :invitor_email=>@invitor_email, :invitees =>[Invitee.new(:invitee_email=>"sriram@gmail.com", :invitee_first_name=>"Sri ram", :invitee_last_name=>"Kapoor", :status =>"Accepted", :challenge=>Challenge.new(:title=>"ch001",:description=>"ch001 task is testing challenge")), Invitee.new(:invitee_email=>"venkat@gmail.com", :invitee_first_name=>"Venkat", :invitee_last_name=>"Reddy", :status =>"Pending")])
    # TYING USING LOOL
    #@as = ChallengeInvitation.new
    @challenge_invitee = ChallengeInvitation.create(:invitee_challenge_id =>@invitee_challenge_id, :invitor_email=>@invitor_email)
   
    @invitee_email.each do |in_email|
      @challenge_invitee.invitees.create(:invitee_email=>"in_email")
    end
    
    @invitee_first_name.each do |en_fname|
      
    end
    
    #@challenge_invitee.invitees.push([Invitee.new(:invitee_email=>"sriram@gmail.com")])

    raise "working on progress"
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

