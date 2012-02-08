class UserMailer < ActionMailer::Base
default :from => "sriram.in20@gmail.com"

def welcome_email(usermail)
@usermail = usermail
@url = "http://www.gmail.com/login" 
mail(:to => usermail.email,
:subject => "Welcome to Mydojo")
end

end 

