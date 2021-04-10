class ApplicationController < ActionController::Base
    include UsersHelper
    include SessionsHelper
    include TrendingHelper
end
