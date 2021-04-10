class TrendingController < ApplicationController
  
  require 'rest-client'
  require 'json'

  before_action :logged_in_user, only: [:show]

  # Displays the requested trending information as html or json
  def show
    fetch_trending
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end
    
end
