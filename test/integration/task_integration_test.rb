require "test_helper"

class TaskIntegrationTest < ActionDispatch::IntegrationTest
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

    @task = {
      title: "My Task",
      completed: false,
      description: "This is my first task"
    }

    @modified_task = {
      title: "My Task edited",
      completed: true,
      description: "This is my first task edited"
    }
  end

  test "create task test" do
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

    post "/api/v1/tasks",
      params: { task: @task.merge(category_id: category_id) },
      headers: { "Authorization" => authorization_token }
    assert_response :success
  end

  test "update task test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    category_id = response_body["data"]["id"]

    post "/api/v1/tasks",
      params: { task: @task.merge(category_id: category_id) },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    task_id = response_body["data"]["id"]

    patch "/api/v1/tasks/#{task_id}",
      params: { task: @modified_task },
      headers: { "Authorization" => authorization_token }
    assert_response :success
  end

  test "delete task test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    category_id = response_body["data"]["id"]

    post "/api/v1/tasks",
      params: { task: @task.merge(category_id: category_id) },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    task_id = response_body["data"]["id"]

    delete "/api/v1/tasks/#{task_id}",
      headers: { "Authorization" => authorization_token }
    assert_response :success
  end

  test "update task completed value test" do
    post '/signup', params: { user: @user }
    # assert_response :success

    post '/login', params: { user: @user }
    # assert_response :success
    authorization_token = response.headers['Authorization'] 

    post "/api/v1/categories",
      params: { category: @category },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    category_id = response_body["data"]["id"]

    post "/api/v1/tasks",
      params: { task: @task.merge(category_id: category_id) },
      headers: { "Authorization" => authorization_token }
    # assert_response :success
    response_body = JSON.parse(response.body)
    task_id = response_body["data"]["id"]

    patch "/api/v1/tasks/#{task_id}/complete",
      params: { task: @task.merge(category_id: category_id) },
      headers: { "Authorization" => authorization_token }
    assert_response :success
  end
end
