module ChallengesHelper

	def markAsComplete
		allTaskComplete = 0
    if isStandalone
      if @challenge.user_id == current_user.gmauth.id
        if @challenge.canCompleteBeforeTasks? 
          @challenge.tasks.each do |aTask| 
            if aTask.is_complete == 0 
              allTaskComplete = 1 			
            end 
          end
          if allTaskComplete == 1 
            link_to "I'm Done with this challenge >> Submit my score",  "#", :style => "text-decoration: none; color:#fff; float:right; position:relative; top:-5px; right: -10px;" ,:class => "links_score_p" 
          else 
            link_to "I'm Done with this challenge >> Submit my score",  challenge_comp_challenges_path(:id=>@challenge), :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right; right: -10px;" ,:class => "links_score_p"
          end
        else
          link_to "I'm Done with this challenge >> Submit my score",  challenge_comp_challenges_path(:id=>@challenge), :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right; right: -10px;" ,:class => "links_score_p"
        end
		else
			link_to "I'm Done with this challenge >> Submit my score",  "#", :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right right: -10px;" ,:class => "links_score_p"
		end 
    else
      if @challenge.user_id == current_user.fbauth.uid
        if @challenge.canCompleteBeforeTasks? 
          @challenge.tasks.each do |aTask| 
            if aTask.is_complete == 0 
              allTaskComplete = 1 			
            end 
          end
          if allTaskComplete == 1 
            link_to "I'm Done with this challenge >> Submit my score",  "#", :style => "text-decoration: none; color:#fff; float:right; position:relative; top:-5px; right: -10px;" ,:class => "links_score_p"
          else 
            link_to "I'm Done with this challenge >> Submit my score",  challenge_comp_challenges_path(:id=>@challenge), :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right; right: -10px;" ,:class => "links_score_p"
          end
        else
          link_to "I'm Done with this challenge >> Submit my score",  challenge_comp_challenges_path(:id=>@challenge), :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right; right: -10px;" ,:class => "links_score_p"
        end
		else
			link_to "I'm Done with this challenge >> Submit my score",  "#", :style => " position:relative; top:-5px; text-decoration: none; color:#fff; float:right right: -10px;" ,:class => "links_score_p"
		end
    end	
	end	
	
end
