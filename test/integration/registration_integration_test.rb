require "test_helper"

class RegistrationIntegrationTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = {
      name: "John Doe",
      email: "john_doe@email.com",
      password: "password123"
    }

    @invalid_user = {
      name: "John Doe",
      email: "john_doe_email.com", #{wrong email format}
      password: "123" #{password too short}
    }
  end

  test "registration success test" do
    post '/signup', params: { user: @user}
    assert_response :success

    # response.status === 200 ? 
    #   (puts "#{User.name} has successfully registered.") 
    #   : (puts "Error: account registration failed")
  end

  test "registration FAILED test" do
    post '/signup', params: { user: @invalid_user}
    assert_response :unprocessable_entity

    # response.status === 422 ?
    # (puts "Error: account registration failed") 
    # : (puts "User has successfully registered.")
  end

end
