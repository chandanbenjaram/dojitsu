class ChallengesController < ApplicationController
  before_filter :authenticate_user!, :except => [:nonLoginShowPersonal, :nonLoginShowSocial, :nonLoginIndex, :registerToMessage]
  before_filter :find_challenge, :only => [:show, :edit, :update, :destroy]
  #on_spot_edit  is the gem to edit the data on spot 
  can_edit_on_the_spot

  def index
    @title = "Challenges"
    @no_of_row = Challenge.all.count
    @challenges = current_user.challenges
    @challengeCompleted = params[:id]
    @orgChallenge = Challenge.where(:_id => params[:id]).first
    cookies[:key] = "orgCompleteTask"
    #raise @orgChallenge.social_type.who_win.inspect
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
  
  def scoreboard_main
    @challenge = Challenge.find(params[:id])
    @this_tasks = @challenge.tasks
    @challenge.child_challenges.each do |childid|
      @cid = childid.user_id 
    end
    @challenge.child_challenges.each do |chalid|
      @chaid = chalid.challenge_id 
    end
  end

  def show_per
    @challenge = Challenge.find(params[:id])
    #GETING ALL USER CONNECTION
    aConnection = []
    @allConnections = UserConnection.select(:target_id).where(:user_id=>current_user.id)
    @allConnections.each do |aTargetId|
      aConnection.push(aTargetId.target_id)
    end
    #ALL CONNECTION AS PARTICIPANT
    @onlyMyFrd = Challenge.all(conditions: {:user_id.in => aConnection, :title => @challenge.title })
    #ALL FRD IN CHALLENGE 
    @myAccepted = [] 
    @myThinking = []
    @myDeclined = []
    @onlyMyFrd.each do |aStatus|
      if aStatus.social_type.status == 1
        @myAccepted.push(aStatus.user_id)
      elsif aStatus.social_type.status == -1
        @myDeclined.push(aStatus.user_id)
      else
        @myThinking.push(aStatus.user_id)
      end
    end
    
    #raise @myAccepted.inspect
    #raise @myDeclined.inspect
    #raise @myThinking.inspect
    
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
          :social_type => ChallengeSocialType.new(:status => 1,:who_win => @so_who_win, :how_many_winners => @so_how_many_winner, :trophy => Trophy.new(:rank=>0))) do |new_challenge|
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
                :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner, :trophy => Trophy.new(:rank=>0)), \
                :tasks => @ch.task_attributes)
          else 
            @challenge.child_challenges.create!(:user_id => invitee, :title => @ch.title, :description => @ch.description, :canCompleteBeforeTasks => @ch.canCompleteBeforeTasks, \
                :start_point => PointNumberType.new(:value => @st_p_val, :label=> @st_p_leb), \
                :end_point => PointNumberType.new(:value => @ed_p_val, :label=>@ed_p_leb), \
                :social_type => ChallengeSocialType.new(:who_win => @so_who_win, :how_many_winners => @so_how_many_winner, :trophy => Trophy.new(:rank=>0)), \
                :tasks => @ch.task_attributes)
          end
        end      
      end  
    end   
    redirect_to show_per_challenges_path(:id => @challenge, :isNewChallenge => "isNew"), :notice => "Challenge created!" 

  

  end
  def publish
    render :layout => false 
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
      #raise "aaa"
      redirect_to :action => 'index', :id => @challenge
    else
      render :action => edit
    end
  end
	
  def destroy
    @challenge.destroy
    redirect_to :action => 'index'
  end  

  def invitee_accepted_req
    
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
      if params[:task_done] == "yes"
        @ch_ts_update.tasks.where(:name => params[:name]).update(:is_complete => 1)
        redirect_to show_per_challenges_path(:id => params[:id], :isNewChallenge => "isNew")
        return
      end
      redirect_to show_per_challenges_path(:id => params[:id])
      return
    else
      @ch_ts_update.tasks.where(:name => params[:name]).update(:is_complete => 1, :score => params[:tatal_s])
      redirect_to show_per_challenges_path(:id => params[:id], :isNewChallenge => "isNew")
      return
    end 
  end

  
  def search_people
		render :layout => false
  end
  
  
  def challenge_comp
    #raise "Maisa"
    #render :layout => false
    Challenge.where(:_id => params[:id]).update(:is_complete => 1)
    redirect_to challenges_path(:isNewChallenge => "isNew", :id => params[:id])
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
  
  def date_updateStart	
    @challenge = Challenge.find(params[:value][:myParams2])
    if params[:value][:myParams3]
      startPoint = @challenge.start_point
      startPoint.update_attributes(:value => params[:value][:myParams1], :label =>params[:value][:myParams3])
	 
    else
      startPoint = @challenge.start_point
      startPoint.update_attributes(:value => params[:value][:myParams1])
      redirect_to challenges_path
    end
  end
  
  def date_updateEnd
    @challenge = Challenge.find(params[:value][:myParams2])
    if params[:value][:myParams3]
      endPoint = @challenge.end_point
      endPoint.update_attributes(:value => params[:value][:myParams1], :label =>params[:value][:myParams3])
    else
      endPoint = @challenge.end_point
      endPoint.update_attributes(:value => params[:value][:myParams1])
      redirect_to challenges_path
    end
  end

  def update_status
    aChallenge = Challenge.find(params[:id])
    socialType = aChallenge.social_type
    socialType.update_attributes(:status => params[:status])
    if params[:status] == '1'       
      redirect_to show_soc_challenges_path(:id => params[:id], :isNewChallenge => "isNew")
    else
      redirect_to show_soc_challenges_path(:id => params[:id]) 
    end
      
  end

  def change_challenge_status
		render :layout => false
  end
  
  def update_status_again
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
  
  def title_update
    @aChallenge = Challenge.find(params[:value][:myParams21])
    @aChallenge.update_attributes(:title =>params[:value][:myParams11]) 
  end

  def desc_update
    @aChallenge = Challenge.find(params[:value][:myParams21])
    @aChallenge.update_attributes(:description =>params[:value][:myParams11]) 
  end
  
  def title_soc_update
    @aChallenge = Challenge.find(params[:value][:myParams21])
    @aChallenge.update_attributes(:title =>params[:value][:myParams11]) 
  end
  
  def desc_soc_update
  	@aChallenge = Challenge.find(params[:value][:myParams21])
    @aChallenge.update_attributes(:description =>params[:value][:myParams11]) 
  end
  
	
  def paginationTest
    @challenge = Challenge.where(:_id => "4ef1a6a454b53001a4000067").first
    $wins ={"first"=>{"id"=>"1", "score"=>"1"},"second"=>{"id"=>"2", "score"=>"2"},"third"=>{"id"=>"3", "score"=>"3"},"fourth"=>{"id"=>"4", "score"=>"4"},"fifth"=>{"id"=>"5", "score"=>"5"}} 
    temp ={"id"=>"10","score"=>"20"} 
    aTotalScore = 0 
   
    $wins["first"]["score"] = 1
    $wins["second"]["score"] = 2
    $wins["third"]["score"] = 3
    $wins["fourth"]["score"] = 4
    $wins["fifth"]["score"] = 5
    
    $wins["first"]["id"] = 1
    $wins["second"]["id"] = 2
    $wins["third"]["id"] = 3
    $wins["fourth"]["id"] = 4
    $wins["fifth"]["id"] = 5

 
   
    if @challenge.instance_of?Challenge
      @challenge.tasks.each_with_index do |orgTasks,index|  
        aTotalScore += orgTasks.score.to_i 
      end 
      $wins["first"]["id"]= @challenge.user_id
      $wins["first"]["score"]= aTotalScore     
      aTotalScore = 0 
      
      @challenge.child_challenges.each do |aChildChallenge|
        aChildChallenge.tasks.each_with_index do |eachTasks,index| 
          aTotalScore += eachTasks.score.to_i  
        end
        #raise aTotalScore.inspect
        if aTotalScore > $wins["first"]["score"] 
          #raise "first less"
          whoWinning aTotalScore, $wins["first"]["score"], aChildChallenge.user_id, 1
          #raise "returned"
          aTotalScore = 0
          next if aTotalScore == 0
        elsif aTotalScore > $wins["second"]["score"]        
          raise "second less"
          whoWinning aTotalScore, $wins["second"]["score"], aChildChallenge.user_id, 2
          #raise "returned"
          aTotalScore = 0
          next
        elsif aTotalScore > $wins["third"]["score"]  
          #raise "third less"
          whoWinning aTotalScore, $wins["third"]["score"], aChildChallenge.user_id, 3
          #raise "returned"
          aTotalScore = 0
          next
        elsif aTotalScore > $wins["fourth"]["score"]  
          #raise "fourht less"
          whoWinning aTotalScore, $wins["fourth"]["score"], aChildChallenge.user_id, 4
          #raise "returned"
          aTotalScore = 0
          next
        else       
          #raise "fifth less"
          whoWinning aTotalScore, $wins["fifth"]["score"], aChildChallenge.user_id, 5
          #raise "returned"
          aTotalScore = 0
          next
        end 
        aTotalScore = 0 
      end
      
    else 
      raise "childchallenge"
    end 
    
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
  def scoreboard_main
    @challenge = Challenge.find(params[:id])
    @this_tasks = @challenge.tasks
	  @challenge.child_challenges.each do |childid|
	 		@cid = childid.user_id 
	  end
	  @challenge.child_challenges.each do |chalid|
      @chaid = chalid.challenge_id 
	  end
  end
  def trophies
    @challenge = Challenge.find(params[:id])
  end
  
  def nonLoginShowSocial
    @challenge = Challenge.find(params[:id])
  end
  
  def nonLoginIndex
    @challenges = Challenge.where(:_type.exists => false).desc("created_at")
  end
  
  def socialpeople
    render :layout => false
  end
  def registerToMessage
  	render :layout=>false
  end
  
  def winnerListPopup
    @challenge = Challenge.where(:_id => params[:id]).first
    Challenge.where(:_id => params[:id]).update(:is_complete => 1)
		render :layout=>false
	end

	def mForWinner		
		@winnerList = params[:winnerList]
		@winnerList.split(" ").each do |eachWinner|
      whomSend = Authentication.find_by_uid(eachWinner)				
      UserMailer.sendMessage(whomSend.email,params[:message]).deliver						
		end
		redirect_to show_soc_challenges_path(:id => params[:challengeId])
	end
  
  
  def update_tasks_list
	  @task_id = params[:id]
	  @challengeId = Challenge.find(params[:challengeId])
	  @myscore = params[:score]
	  @challengeId.tasks.each do |aTask|
	  
      if aTask.id.to_s==@task_id
			   
			  aTask.update_attribute("total",@myscore)
        if  aTask.total !=0
					aTask.update_attribute("is_complete",1)
				end
      end
    end
    t= DateTime.now
    date=t.strftime("%d/%m/%y%H:%M:%S") 
	   
    redirect_to show_per_challenges_path(:id => @challengeId.id)
  end
  
  def myscore_update_self_report
		#raise params.inspect
		@sum = params[:sum]
		@challengeId = Challenge.find(params[:challenge])
		#@ch =params[:challenge]
		@task=params[:task]
		#raise @sum.strip.inspect
		#raise @ch_id.inspect
		@my_total= @sum.strip
		@challengeId.tasks.each do |aTask|
      if aTask.id.to_s==@task
        aTask.update_attribute("total",@my_total)
        if  aTask.total !=0
          aTask.update_attribute("is_complete",1)
        end
      end
    end
		#raise @my_total.inspect
    #@ch_id = Challenge.find(params[:ch_id])
	 
    redirect_to show_per_challenges_path(:id => @challengeId.id)
  end
		
		
  def deleteWinner
    #raise Challenge.all(conditions: {:user_id=>'100002573213371', :challenge_id=>BSON::ObjectId('4f38f7f779216d45d4000007')}).first.inspect
    @challenge = Challenge.where(:_id=>params[:id]).first
    @challenge.social_type.create_trophy(:rank=>-1)				
    redirect_to show_per_challenges_path(:id => params[:id])			
  end
		
  def storeWinner
		#raise params.inspect
		#raise @winners = params[:winners].inspect
		#@winnerTitle = params[:title]
		#@noOfWinner = params[:noOfWinner]
		#raise @winners = params[:orgId].inspect
		#raise "Maisa"
		@flag = 1
    @latestScore = 1
		winner = []
		@flagBreak = 0
		@challenge = Challenge.where(:_id=>params[:orgId]).first
		@noOfWinner = @challenge.social_type.how_many_winners
		Challenge.winner(params[:orgId]).each do |winnerId, index|
			#raise winnerId.inspect
			#raise winnerScore.inspect

			@currentChallenge = Challenge.all(conditions: {:user_id=> winnerId, :title=> @challenge.title}).first
						

			if @flag == 1
        @currentChallenge.social_type.create_trophy(:rank=>1)                           
        @latestScore = index 
        @flag += 1 
      elsif @flag == 2
        if @latestScore == index 
          @currentChallenge.social_type.create_trophy(:rank=>1)                             
        else 
          @currentChallenge.social_type.create_trophy(:rank=>2)                             
          @latestScore = index 
          @flag += 1 
        end               
      elsif @flag == 3              
        if @latestScore == index 
          @currentChallenge.social_type.create_trophy(:rank=>2)                             
        else 
          @currentChallenge.social_type.create_trophy(:rank=>3)                             
          @latestScore = index 
          @flag += 1 
        end  
      elsif @flag == 4
        if @latestScore == index 
          @currentChallenge.social_type.create_trophy(:rank=>3)
        else 
          @currentChallenge.social_type.create_trophy(:rank=>4)                             
          @latestScore = index 
          @flag += 1 
        end                 
      elsif @flag == 5
        if @latestScore == index
          @currentChallenge.social_type.create_trophy(:rank=>4)                                         
        else 
          @currentChallenge.social_type.create_trophy(:rank=>5)                             
          @latestScore = index 
          @flag += 1 
        end                 
      elsif @flag == 6
        if @latestScore == index 
          @currentChallenge.social_type.create_trophy(:rank=>5)                             
        else 
          @currentChallenge.social_type.create_trophy(:rank=>6)                             
          @latestScore = index 
          @flag += 1 
        end                 
      else

      end


			winner.push(winnerId)	
			@flagBreak+=1
			if @flagBreak == @noOfWinner.to_i
				break
			end	
		end
		#raise winner.inspect
		#@winners.each do |sd|
		#	raise sd.inspect
		#end


		#@tr= [[&quot;100002573213371&quot;, 0], [&quot;100003174704960&quot;, 0], [&quot;100003276706127&quot;, 0], [&quot;100003135115833&quot;, 0], [&quot;100000974421554&quot;, 0], [&quot;100000018823471&quot;, 0]]

		#@tr= [&quot;100002573213371&quot;, 0].inspect

		#@ch = Challenge.where(:title=>"people status checking").first
		#@ch = Challenge.where(:title=>"trophy").first
		#raise @ch.social_type.trophy.inspect
		#raise @ch.social_type.trophy.class.inspect		

	end
	
	def whoAccepted
		@accepted = []
		@thinking = []
		@declined = []	
		@orgChallenge = Challenge.where(:_id=>params[:id]).first					
		#raise @orgChallenge.id.inspect
		@accepted.push(@orgChallenge.user_id)
		Challenge.where(:_id=>params[:id]).first.child_challenges.each do |eachChild|
			#raise eachChild.inspect
			@childChallenge = Challenge.all(conditions: {:user_id=> eachChild.user_id, :challenge_id => @orgChallenge.id }).first
			if @childChallenge.social_type.status.to_i == 1
				@accepted.push(@childChallenge.user_id)
			elsif @childChallenge.social_type.status.to_i == -1
				@declined.push(@childChallenge.user_id)
			else
				@thinking.push(@childChallenge.user_id)
			end	
		end
		#raise @accepted.inspect
		#raise @thinking.inspect
		#raise @declined.inspect
		render :layout=> false
	end
	
	def whoThinking
		@accepted = []
		@thinking = []
		@declined = []	
		@orgChallenge = Challenge.where(:_id=>params[:id]).first					
		#raise @orgChallenge.id.inspect
		@accepted.push(@orgChallenge.user_id)
		Challenge.where(:_id=>params[:id]).first.child_challenges.each do |eachChild|
			#raise eachChild.inspect
			@childChallenge = Challenge.all(conditions: {:user_id=> eachChild.user_id, :challenge_id => @orgChallenge.id }).first
			if @childChallenge.social_type.status.to_i == 1
				@accepted.push(@childChallenge.user_id)
			elsif @childChallenge.social_type.status.to_i == -1
				@declined.push(@childChallenge.user_id)
			else
				@thinking.push(@childChallenge.user_id)
			end	
		end
		#raise @accepted.inspect
		#raise @thinking.inspect
		#raise @declined.inspect
		render :layout=> false
	end
	
	def whoDeclined
		@accepted = []
		@thinking = []
		@declined = []	
		@orgChallenge = Challenge.where(:_id=>params[:id]).first					
		#raise @orgChallenge.id.inspect
		@accepted.push(@orgChallenge.user_id)
		Challenge.where(:_id=>params[:id]).first.child_challenges.each do |eachChild|
			#raise eachChild.inspect
			@childChallenge = Challenge.all(conditions: {:user_id=> eachChild.user_id, :challenge_id => @orgChallenge.id }).first
			if @childChallenge.social_type.status.to_i == 1
				@accepted.push(@childChallenge.user_id)
			elsif @childChallenge.social_type.status.to_i == -1
				@declined.push(@childChallenge.user_id)
			else
				@thinking.push(@childChallenge.user_id)
			end	
		end
		#raise @accepted.inspect
		#raise @thinking.inspect
		#raise @declined.inspect
		render :layout=> false
	end
	
	def myAccepted	
    @orgChallenge = Challenge.where(:_id=>params[:id]).first		 		
    #GETING ALL USER CONNECTION
    aConnection = []
    @allConnections = UserConnection.select(:target_id).where(:user_id=>current_user.id)
    @allConnections.each do |aTargetId|
      aConnection.push(aTargetId.target_id)
    end
    #ALL CONNECTION AS PARTICIPANT
    @onlyMyFrd = Challenge.all(conditions: {:user_id.in => aConnection, :challenge_id => @orgChallenge.id })
    #ALL FRD IN CHALLENGE 
    @myAccepted = [] 
    @myThinking = []
    @myDeclined = []
    @onlyMyFrd.each do |aStatus|
      if aStatus.social_type.status == 1
        @myAccepted.push(aStatus.user_id)
      elsif aStatus.social_type.status == -1
        @myDeclined.push(aStatus.user_id)
      else
        @myThinking.push(aStatus.user_id)
      end
    end
    render :layout=> false
    #raise @myAccepted.inspect
    #raise @myDeclined.inspect
    #raise @myThinking.inspect
	end
	
	def myThinking
    @orgChallenge = Challenge.where(:_id=>params[:id]).first
    #GETING ALL USER CONNECTION
    aConnection = []
    @allConnections = UserConnection.select(:target_id).where(:user_id=>current_user.id)
    @allConnections.each do |aTargetId|
      aConnection.push(aTargetId.target_id)
    end
    #ALL CONNECTION AS PARTICIPANT
    @onlyMyFrd = Challenge.all(conditions: {:user_id.in => aConnection, :challenge_id => @orgChallenge.id })
    #ALL FRD IN CHALLENGE 
    @myAccepted = [] 
    @myThinking = []
    @myDeclined = []
    @onlyMyFrd.each do |aStatus|
      if aStatus.social_type.status == 1
        @myAccepted.push(aStatus.user_id)
      elsif aStatus.social_type.status == -1
        @myDeclined.push(aStatus.user_id)
      else
        @myThinking.push(aStatus.user_id)
      end
    end
    render :layout=> false
    #raise @myAccepted.inspect
    #raise @myDeclined.inspect
    #raise @myThinking.inspect
	end
	
	def myDeclined
    @orgChallenge = Challenge.where(:_id=>params[:id]).first
    #GETING ALL USER CONNECTION
    aConnection = []
    @allConnections = UserConnection.select(:target_id).where(:user_id=>current_user.id)
    @allConnections.each do |aTargetId|
      aConnection.push(aTargetId.target_id)
    end
    #ALL CONNECTION AS PARTICIPANT
    @onlyMyFrd = Challenge.all(conditions: {:user_id.in => aConnection, :challenge_id => @orgChallenge.id })
    #ALL FRD IN CHALLENGE 
    @myAccepted = [] 
    @myThinking = []
    @myDeclined = []
    @onlyMyFrd.each do |aStatus|
      if aStatus.social_type.status == 1
        @myAccepted.push(aStatus.user_id)
      elsif aStatus.social_type.status == -1
        @myDeclined.push(aStatus.user_id)
      else
        @myThinking.push(aStatus.user_id)
      end
    end
    render :layout=> false
    #raise @myAccepted.inspect
    #raise @myDeclined.inspect
    #raise @myThinking.inspect
	end
	
  
  protected

  def find_challenge
    @challenge = Challenge.all
  end
  
  def whoWinning(tempScore, winnerScore, winnerId, aPossition  )
    aTScore = 0
    aTId = 0
    if aPossition == 5
      $wins["fifth"]["score"],$wins["fifth"]["id"] = tempScore,winnerId
      raise $wins.inspect
      return
    else
      if aPossition == 1
        #raise "replaceing 1st"
        #raise tempScore.inspect
        #raise winnerScore.inspect
        #raise winnerId.inspect
        aTScore,$wins["first"]["score"] = winnerScore,tempScore
        #raise $wins["first"]["score"].inspect
        #raise aTScore.inspect
        $wins["second"]["score"],aTId = aTScore,$wins["first"]["id"]
        $wins["first"]["id"],$wins["second"]["id"] = winnerId,aTId
        #raise $wins["first"]["id"].inspect
        #raise $wins["second"]["id"].inspect
        #aTId = $wins["second"]["id"]
        if $wins["third"]["score"].to_i > $wins["second"]["score"]
          whoWinning $wins["third"]["score"], $wins["second"]["score"], $wins["third"]["score"], 2
        else
          #raise "Third is not greter"
          return 1
        end
      end
        
      if aPossition == 2
        #aTScore,$wins["second"]["score"] = $wins["second"]["score"],tempScore
        #aTId = $wins["third"]["id"]
        #$wins["third"]["score"],$wins["second"]["id"] = aTScore,winnerId
        #if $wins["fourth"]["score"].to_i > $wins["third"]["score"]
        #    whoWinning $wins["fourth"]["score"], $wins["third"]["score"], aTId, 3                
        #end
            
        #raise "replaceing 2nd"
        #raise tempScore.inspect
        #raise winnerScore.inspect
        #raise winnerId.inspect
        aTScore,$wins["first"]["score"] = winnerScore,tempScore
        #raise $wins["first"]["score"].inspect
        #raise aTScore.inspect
        $wins["second"]["score"],aTId = aTScore,$wins["first"]["id"]
        $wins["first"]["id"],$wins["second"]["id"] = winnerId,aTId
        #raise $wins["first"]["id"].inspect
        #raise $wins["second"]["id"].inspect
        #aTId = $wins["second"]["id"]
        if $wins["third"]["score"].to_i > $wins["second"]["score"]
          whoWinning $wins["third"]["score"], $wins["second"]["score"], $wins["third"]["score"], 2
        end
        
        
      end
        
      if aPossition == 3
        aTScore,$wins["third"]["score"] = $wins["third"]["score"],tempScore
        aTId = $wins["fourth"]["id"]
        $wins["fourth"]["score"],$wins["third"]["id"] = aTScore,winnerId
        if $wins["fifth"]["score"].to_i > $wins["fourth"]["score"]
          whoWinning $wins["fifth"]["score"], $wins["fourth"]["score"], aTId, 4                
        end
      end
        
      if aPossition == 4
        aTScore,$wins["fourth"]["score"] = $wins["fourth"]["score"],tempScore
        aTId = $wins["fifth"]["id"]
        $wins["fifth"]["score"],$wins["fourth"]["id"] = aTScore,winnerId
        #whoWinning $wins["fifth"]["score"], $wins["fourth"]["score"], aTId, 5            
      end
    end
  end
  

end




