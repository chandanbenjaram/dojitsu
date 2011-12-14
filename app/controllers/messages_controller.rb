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
	
end
