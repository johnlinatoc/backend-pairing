require 'test_helper'

class ScheduledPairsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scheduled_pair = scheduled_pairs(:one)
  end

  test "should get index" do
    get scheduled_pairs_url, as: :json
    assert_response :success
  end

  test "should create scheduled_pair" do
    assert_difference('ScheduledPair.count') do
      post scheduled_pairs_url, params: { scheduled_pair: { pair_id: @scheduled_pair.pair_id, user_id: @scheduled_pair.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show scheduled_pair" do
    get scheduled_pair_url(@scheduled_pair), as: :json
    assert_response :success
  end

  test "should update scheduled_pair" do
    patch scheduled_pair_url(@scheduled_pair), params: { scheduled_pair: { pair_id: @scheduled_pair.pair_id, user_id: @scheduled_pair.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy scheduled_pair" do
    assert_difference('ScheduledPair.count', -1) do
      delete scheduled_pair_url(@scheduled_pair), as: :json
    end

    assert_response 204
  end
end
