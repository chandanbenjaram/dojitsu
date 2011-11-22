class DashboardController < ApplicationController
  def index
	@all_new_challenge = Challenge.desc("created_at").limit(3)
	@org_name = Authentication.find(:all, :conditions => ["uid=?",session[:f_id]]).first
	#@auth_details = Authentication.find(:all, :conditions => ["uid=?",session[:f_id]]).first
    #@ch_ts_update = Challenge.find("4ec8aed8192b880ac8000017")
    #raise @chaild_ch = @ch_ts_update.child_challenges.where(:user_id => "100000974421554").inspect
    #raise @chaild_ch = Challenge.child_challenges.where(:user_id => "100000974421554").inspect
  end
end
