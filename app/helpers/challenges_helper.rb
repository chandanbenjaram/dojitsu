module ChallengesHelper

	def markAsComplete
		allTaskComplete = 0
		if @challenge.user_id == current_user.fbauth.uid
			if @challenge.canCompleteBeforeTasks? 
				@challenge.tasks.each do |aTask| 
					if aTask.is_complete == 0 
						allTaskComplete = 1 			
					end 
				end
				if allTaskComplete == 1 
					link_to "MARK AS COMPLETED",  "#", :style => "text-decoration: none; color:#fff; float:right" ,:class => "challenge_mark_as_c"
				else 
					link_to "MARK AS COMPLETED",  challenge_comp_challenges_path(:id=>@challenge), :style => "text-decoration: none; color:#fff; float:right" ,:class => "challenge_mark_as_c"
				end
			else
				link_to "MARK AS COMPLETED",  challenge_comp_challenges_path(:id=>@challenge), :style => "text-decoration: none; color:#fff; float:right" ,:class => "challenge_mark_as_c"
			end
		else
			link_to "MARK AS COMPLETED",  "#", :style => "text-decoration: none; color:#fff; float:right" ,:class => "challenge_mark_as_c"
		end	
	end	
	
end
