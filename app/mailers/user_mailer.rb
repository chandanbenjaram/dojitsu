class UserMailer < ActionMailer::Base
  default from: "sriram.in20@gmail.com"
    def welcome_email(user)
    @user = user
    @url  = "http://example.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
  
  def sendMail(email,aMessage)
    mail(:to => email, :subject => "You have mail form dojitsu friend", :body => aMessage)
  end  
end
