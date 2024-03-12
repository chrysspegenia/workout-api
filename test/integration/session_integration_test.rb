require "test_helper"

class SessionIntegrationTest < ActionDispatch::IntegrationTest
  def setup
    @user = {
      name: "John Doe",
      email: "john_doe@email.com",
      password: "password123"
    }
  end


  test "login successful test"  do
    post '/signup', params: { user: @user }

    post '/login', params: { user: @user }
    assert_response :success
    assert_equal "Logged in successfully.", JSON.parse(response.body)['message']
  end

  test "logout successful test"  do
    post '/signup', params: { user: @user }
    assert_response :success

    post '/login', params: { user: @user }
    assert_response :success
    authorization_token = response.headers['Authorization'] 

    delete '/logout', headers: { 'Authorization' => authorization_token }
    assert_response :success
    assert_equal "Logged out successfully.", JSON.parse(response.body)['message']
  end

end
