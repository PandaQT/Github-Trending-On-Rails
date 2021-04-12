require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "testUser", email: "test@email.com", 
                      password: "testpassword", password_confirmation: "testpassword")
  end

  test "should be valid" do
    assert @user.valid?
  end

  #################
  # Test presence #
  #################

  test "name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "password should be present" do
    @user.password = ""
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  ###########################
  # Test length constraints #
  ############################
  
  test "name should not be too short" do
    @user.name = "a" * 3
    assert_not @user.valid?
  end

  test "password should not be too short" do
    @user.password = "a" * 5
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "a" * 13
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 92 + "@email.com"
    assert_not @user.valid?
  end

  test "password should not be too long" do
    @user.password = "a" * 21
    assert_not @user.valid?
  end
  
  ####################
  # Test uniqueness #
  ####################

  test "name should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = "testUser2@email.com"
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.name = "testUser2"
    @user.save
    assert_not duplicate_user.valid?
  end

end
