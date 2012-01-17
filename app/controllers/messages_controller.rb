class MessagesController < ApplicationController
  before_filter :authenticate_user!, :except =>[:storemessage] 
  
	def storemessage
		@name = params[:messageDetails][:name]
		@to = params[:messageDetails][:recipients]
		@from = params[:messageDetails][:author_id]
		@body = params[:messageDetails][:body]
		@to.each do |messageTo|
			unless messageTo == @from  
				Message.create(:to => messageTo, :from => @from, :body => @body, :subject => @name)
			end	
		end
	end
  
  def message
		render :layout => false
	end
  
  def newmessage
    from = User.find_by_id(current_user.id)
    to = User.find_by_email(params[:to])
    Message.create(:to =>to.id, :from =>from.id, :body => params[:message])
    redirect_to dashboard_index_path
  end
	
end
