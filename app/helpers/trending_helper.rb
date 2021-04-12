module TrendingHelper

    # Prepare user input for comparison with db
    def cleaned_query_param
        query = params[:language].downcase.strip
        query.gsub(" ", "-")
      end

    # Fetches the requested information if the query is supported
    def fetch_trending
        if Trending.find_by(language: cleaned_query_param) 
          begin
            @result = cached_trending
          rescue Errno::ECONNREFUSED => e
            @result =  { 
                        ExceptionClass: e.class.name,
                        ExceptionMessage: e.message,
                        Information: "Try running the github-trending-api first" 
                      }
          end
        else
          @result = { Information: "There is no technology that matches your search available" }
        end
      end
  
      # Fetch value for requested cache key if it dosen't exist calls trending_request and saves the requested data to the cache
      def cached_trending
        Rails.cache.fetch(cleaned_query_param, cache_nils: false, :expires_in => 1.hours) do
          request_trending
          #Check for empty array in case there are no trending devs for the specified technology
          unless @data.empty?
            format_trending
          else
            no_trending_devs = { Information: "There are currently no trending developers in this category" }
          end
        end
      end
  
      # Makes a GET-Request to the third-party-api to fetch a requested technology
      def request_trending
        base_uri = 'http://localhost:8888/developers'
        response = RestClient.get( base_uri, { params: { language: cleaned_query_param } } )
        @data = JSON.parse(response) 
      end
  
      # Changes the format of the third-party-api response to the desired output
      def format_trending
        @formatted_arr = []
        @data.each do |data| 
          hash = {}
          # Check for edge case of trending developers without a repository
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
