class DashboardController < ApplicationController
  def index
    @as = Challenge.find(:all).count
 
  end

end
