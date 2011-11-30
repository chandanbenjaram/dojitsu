class DashboardController < ApplicationController
  def index
	@all_new_challenge = Challenge.desc("created_at").limit(3)
  end
end