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
  end
  
  def destroy
    aDelete = Message.where(:_id =>params[:id]).first
    aDelete.update_attributes(:isDeleted => 1)
    render 'index'
  end
end
