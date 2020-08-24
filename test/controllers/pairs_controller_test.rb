require 'test_helper'

class PairsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pair = pairs(:one)
  end

  test "should get index" do
    get pairs_url, as: :json
    assert_response :success
  end

  test "should create pair" do
    assert_difference('Pair.count') do
      post pairs_url, params: { pair: { sprint_id: @pair.sprint_id } }, as: :json
    end

    assert_response 201
  end

  test "should show pair" do
    get pair_url(@pair), as: :json
    assert_response :success
  end

  test "should update pair" do
    patch pair_url(@pair), params: { pair: { sprint_id: @pair.sprint_id } }, as: :json
    assert_response 200
  end

  test "should destroy pair" do
    assert_difference('Pair.count', -1) do
      delete pair_url(@pair), as: :json
    end

    assert_response 204
  end
end
