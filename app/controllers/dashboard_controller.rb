class DashboardController < ApplicationController
  def index
	@all_new_challenge = Challenge.desc("created_at").limit(3)
	
	
	#raise Challenge.where({:user_id=>session[:f_id]}).all.inspect
	
	#raise @ch = Challenge.select("title,description").first.inspect
	
	#@ch = Challenge.all.first
	
	
	#find child challenge
	#@child = @ch.child_challenges
	
	#find parent challenge
	#@child.each do |chall|
	#	raise chall.parent_challenge.inspect
	#end

	
	#raise Challenge.all(:conditions => {:user_id => session[:f_id] }).inspect
	
	
	#@org_name = Authentication.find(:all, :conditions => ["uid=?",session[:f_id]]).first
	#@auth_details = Authentication.find(:all, :conditions => ["uid=?",session[:f_id]]).first
    #@ch_ts_update = Challenge.find("4ec8aed8192b880ac8000017")
    #raise @chaild_ch = @ch_ts_update.child_challenges.where(:user_id => "100000974421554").inspect
    #raise @chaild_ch = Challenge.child_challenges.where(:user_id => "100000974421554").inspect
  end
end
