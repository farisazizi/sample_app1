require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  def setup
    @user      = users(:theusers)
    @otheruser = users(:cereal)
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should redirect index when not log in" do 
    get :index
    assert_redirected_to login_url
  end
  
  test "should redirect edit when not log in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect update when not log in" do 
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert_not flash.empty?
    assert_redirected_to login_url
  end
  
  test "should redirect edit when log in as wrong user" do
    log_in_as(@otheruser)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect update when log in as wrong user" do 
    log_in_as(@otheruser)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end
  
  test "should redirect destroy when log in" do
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when logged in as a non-admin" do
    log_in_as(@otheruser)
    assert_no_difference 'User.count' do
      delete :destroy, id: @user
    end
    assert_redirected_to root_url
  end

end
