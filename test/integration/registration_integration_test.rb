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
  end

  test "registration FAILED test" do
    post '/signup', params: { user: @invalid_user}
    assert_response :unprocessable_entity
  end

end
