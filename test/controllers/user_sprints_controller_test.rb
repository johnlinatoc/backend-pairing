require 'test_helper'

class UserSprintsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_sprint = user_sprints(:one)
  end

  test "should get index" do
    get user_sprints_url, as: :json
    assert_response :success
  end

  test "should create user_sprint" do
    assert_difference('UserSprint.count') do
      post user_sprints_url, params: { user_sprint: { sprint_id: @user_sprint.sprint_id, user_id: @user_sprint.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show user_sprint" do
    get user_sprint_url(@user_sprint), as: :json
    assert_response :success
  end

  test "should update user_sprint" do
    patch user_sprint_url(@user_sprint), params: { user_sprint: { sprint_id: @user_sprint.sprint_id, user_id: @user_sprint.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy user_sprint" do
    assert_difference('UserSprint.count', -1) do
      delete user_sprint_url(@user_sprint), as: :json
    end

    assert_response 204
  end
end
