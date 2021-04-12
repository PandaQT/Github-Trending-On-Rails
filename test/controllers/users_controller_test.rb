require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

    def setup
        @user = users(:test)
        @user2 = users(:test2)
    end
    
    ###########
    # show    #
    ###########

    test "should redirect show when not logged in" do
        get user_path(@user)
        assert_redirected_to login_url 
    end

    test "should get show when logged in" do
        log_in_as(@user)
        get user_path(@user)
        assert_response :success
    end

    test "should redirect show when logged in as incorrect user" do
        log_in_as(@user)
        get user_path(@user2)
        assert_redirected_to root_url
    end

    ###########
    # new     #
    ###########

    test "should get new" do
        get signup_path
        assert_response :success
    end

    test "should redirect new when already logged in" do
        log_in_as(@user)
        get signup_path
        assert_redirected_to root_url
    end

    ###########
    # create  #
    ###########

    test "Should create user" do
        assert_difference 'User.count', +1 do  
            post users_path(), params: { user: { name: "newUser", 
                                                 email: "new@user.com",
                                                 password: "password",
                                                 password_confirmation: "password" } }
        end
        assert_equal "Successfully created.", flash[:success]
    end

    test "Should not create user" do
        assert_no_difference 'User.count' do  
            post users_path(), params: { user: { name: "newUser", 
                                                 email: "new@user.com",
                                                 password: "",
                                                 password_confirmation: "" } }
        end
        assert_equal "Could not create User", flash[:danger]
    end
    
    ###########
    # edit    #
    ###########

    test "should redirect edit when not logged in" do
        get edit_user_path(@user)
        assert_redirected_to login_path
    end

    test "should get edit when logged in" do
        log_in_as(@user)
        get edit_user_path(@user)
        assert_response :success
    end

    test "should redirect edit when logged in as incorrect user" do
        log_in_as(@user)
        get edit_user_path(@user2)
        assert_redirected_to root_url
    end

    ###########
    # update  #
    ###########

    test "should redirect update when not logged in" do
        patch user_path(@user), params: { user: { name: @user2.name, 
                                                    email: @user2.email,
                                                    password: "password",
                                                    password_confirmation: "password" } }                                    
        assert_redirected_to login_path
    end

    test "should update when logged in" do
        log_in_as(@user)
        patch user_path(@user), params: { user: { name: @user.name, 
                                                   email: @user.email,
                                                   password: "password",
                                                   password_confirmation: "password" } }
        assert_equal "Successfully updated", flash[:success]
        assert_redirected_to user_path(@user)
    end

    test "should redirect update when logged in as incorrect user" do
        log_in_as(@user)
        patch user_path(@user2), params: { user: { name: @user2.name, 
                                                   email: @user2.email,
                                                   password: "password",
                                                   password_confirmation: "password" } }                                    
        assert_redirected_to root_url
    end
  
    test "should not update when blank" do
        log_in_as(@user)
        patch user_path(@user), params: { user: { name: "", 
                                                   email: @user.email,
                                                   password: "password",
                                                   password_confirmation: "password" } }
        assert_equal "Could not update your account", flash[:danger]
    end

    ###########
    # destroy #
    ###########

    test "should redirect destroy when not logged in" do
        assert_no_difference 'User.count' do
            delete user_path(@user)
        end  
        assert_redirected_to login_path
    end

    test "should destroy when logged in" do
        log_in_as(@user) 
        assert_difference 'User.count', -1 do  
            delete user_path(@user)   
        end       
        assert_equal "Successfully deleted #{@user.name}", flash[:success]                       
        assert_redirected_to root_url
    end

    test "should redirect destroy when logged in as incorrect user" do
        log_in_as(@user)
        assert_no_difference 'User.count' do  
            delete user_path(@user2) 
        end    
        assert_redirected_to root_url
    end

end
