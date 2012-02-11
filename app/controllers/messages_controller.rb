class MessagesController < ApplicationController
  before_filter :authenticate_user! 
  
	def storemessage    
	 	@from = params[:author_id]
		@to = params[:recipients]
		@subject = params[:attachment][:name]
		@snippet = params[:snippet]
    @body = params[:body]
		@to.each do |messageTo|
			unless messageTo == @from  
				Message.create(:to => messageTo, :from => @from, :body => @body, :snippet => @snippet ,:subject => @name)
			end	
		end
		
		# ajax response
    
	end
  
  def newmessage 
    whomSend = Authentication.find_by_email(params[:to])
    UserMailer.sendMail(params[:to],params[:message]).deliver
    Message.create(:to =>whomSend.uid, :from =>current_user.fbauth.uid, :body => params[:message])
    redirect_to messages_path
  end
	
  def individualAllMessage
    @iId = params[:iId]    
    @wayToRead = Message.where(:_id => params[:id]).first
    @wayToRead.update_attributes(:isRead => 1)
    details = Authentication.find_by_uid(params[:iId])
    @toEmail = details.email    
  end
  
  def destroy
    #Message.where(:_id =>params[:id]).destroy
    aDelete = Message.where(:_id =>params[:id]).first
    aDelete.update_attributes(:isDeleted => 1)
    render 'index'
  end
  
  def markUnread    
    aUnread = Message.where(:_id =>params[:id]).first
    aUnread.update_attributes(:isRead => 0)
    render 'index'
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

end
