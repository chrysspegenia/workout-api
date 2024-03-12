require "test_helper"

class CategoriesIntegrationTest < ActionDispatch::IntegrationTest
  def setup
    @user = {
      name: "John Doe",
      email: "john_doe@email.com",
      password: "password123"
    }

    @category = {
      title: "My Category",
      description: "This is my category"
    }

    @modified_category = {
      title: "My Category edited",
      description: "This is my category edited"
    }
  end

  test "create category test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token}
      assert_response :success
  end

  test "update category test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token}
    # assert_response :success
    response_body = JSON.parse(response.body)
    category_id = response_body["data"]["id"]

    patch "/api/v1/categories/#{category_id}",
      params: { category: @modified_category },
      headers: { "Authorization" => authorization_token}
    assert_response :success
  end

  test "delete category test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token}
    # assert_response :success
    response_body = JSON.parse(response.body)
    category_id = response_body["data"]["id"]

    delete "/api/v1/categories/#{category_id}",
      headers: { "Authorization" => authorization_token}
    assert_response :success
  end
end