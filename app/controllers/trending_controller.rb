class TrendingController < ApplicationController
  
  require 'rest-client'
  require 'json'

  before_action :logged_in_user, only: [:show]

  #Displays the requested information as html or json
  def show
    @test2 = Rails.cache.instance_variable_get(:@data).keys
    @result = fetch_trending
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  private

    # Checks cache for existing entry if non-exists makes a request, formats it and saves it to the cache 
    def fetch_trending
      Rails.cache.fetch(params[:language], :expires_in => 1.hours) do
        trending_request
        format_trending
      end
    end

    # Makes a GET-Request to the third-party-api to fetch a requested technology
    def trending_request
      base_uri = 'http://localhost:8888/developers'
      response = RestClient.get( base_uri, { params: { language: params[:language] } } )
      @data = JSON.parse(response)
    end
    
    # Changes the format of the third-party-api response to the desired output
    def format_trending
      @formatted_arr = []
      @data.each do |data| 
        hash = {}
        # Check for edge case of Trending Devs without a repo
        if data.include? 'repo'
          hash = {  
                  name: data['name'], 
                  username: data['username'],   
                  avatar: data['avatar'],
                    repo: { name: data['repo']['name'] }, 
                  description: data['repo']['description'],
                  url: data['repo']['url']
                }
        else 
          hash = {  
                  name: data['name'],
                  username: data['username'],
                  avatar: data['avatar'],
                }
        end
        @formatted_arr << hash
      end
      @formatted_arr
    end

end
