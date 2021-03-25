class TrendingController < ApplicationController
  
  require 'rest-client'
  require 'json'

  def show
    fetch_trending
    format_output
  
    respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @formatted_arr }
    end
  end

  private

    #Make a get Request for the desiered technology based on query param provided by user
    def fetch_trending
      base_uri = 'http://localhost:8888/developers'
      query_param = request.query_parameters.fetch("language")
      response = RestClient.get( base_uri, { params: { language: query_param } } )
      @data = JSON.parse(response)
    end
    
    #Changes the format of the json recieved from third-party to the desired output
    def format_output
      @formatted_arr = []
      @data.each do |data| 
        hash = {}
        hash = {  
                  name: data['name'], 
                  username: data['username'], 
                  avatar: data['avatar'], 
                    repo: { name: data['repo']['name'] }, 
                  description: data['repo']['description'],
                  url: data['repo']['url']
                }
      @formatted_arr << hash
    end
    @formatted_arr
  end

end
