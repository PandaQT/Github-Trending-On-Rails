require "test_helper"

class TrendingControllerTest < ActionDispatch::IntegrationTest
  
    def setup
        @user = users(:test)
    end

    test "should redirect show when not logged in" do
        get trending_path
        assert_redirected_to login_url
    end

    test "should get show when logged in" do
        log_in_as(@user)
        get trending_path, params: { language: "" }
        assert_response :success
    end

    test "should get show as json when logged in" do
        log_in_as(@user)
        get trending_path, params: { language: "" }, as: :json
        assert_response :success
    end

end
