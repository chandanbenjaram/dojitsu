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
    whomSend = Authentication.where(:email=>params[:to]).first
    UserMailer.sendMail(params[:to],params[:message]).deliver
    if whomSend.blank?
      flash[:error] = "Recipient is not a User of Dojitsu Application"
    else
      Message.create(:to =>whomSend.uid, :from =>current_user.fbauth.uid, :body => params[:message])
      flash[:success] = "Message Delivered Successfully"
    end
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

end
