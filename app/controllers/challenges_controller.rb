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
    #raise params.inspect
    raise @ch = Challenge.new(params[:challenge]).inspect
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
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, \
      :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner)) do |new_challenge|
        if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
          new_challenge.start_point =  PointDateType.new(:value => @st_p_val1)
          new_challenge.end_point = PointDateType.new(:value => @ed_p_val1) 
        else
          new_challenge.start_point =  PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb)
          new_challenge.end_point = PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb) 
        end

        if !params[:invitees].nil?
          params[:invitees].split(",").each do |invitee|
            new_challenge.child_challenges.build(:user_id => invitee, :title => @ch.title, :description => @ch.description, \
            :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
            :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
            :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win))
          end      
        end        
      end
    else
      #raise "per"
      @challenge = Challenge.new(:user_id => (current_user.fbauth.uid rescue current_user.id), :title => @ch.title, :description => @ch.description, \
      :personal_type => ChallengePersonalType.new(:who_win => @pr_who_win)) do |new_challenge|
        if @ch_st_date == "#ch_st_dat" and  @ch_ed_date == "#ch_ed_dat"
          new_challenge.start_point =  PointDateType.new(:value => @st_p_val1)
          new_challenge.end_point = PointDateType.new(:value => @ed_p_val1) 
        else
          new_challenge.start_point =  PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb)
          new_challenge.end_point = PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb) 
        end
      end            
    end

    @ch.tasks.each do |task_attr|
      @challenge.tasks.build(task_attr)
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

