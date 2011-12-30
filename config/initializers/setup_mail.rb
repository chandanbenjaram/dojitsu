

ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "localhost:4000",  
     :user_name            => "sriram.in20@gmail.com", #Your user name
      :password             => "9866266845", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }