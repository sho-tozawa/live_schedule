require 'test_helper'

class LiveHousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @live_house = live_houses(:one)
  end

  test "should get index" do
    get live_houses_url
    assert_response :success
  end

  test "should get new" do
    get new_live_house_url
    assert_response :success
  end

  test "should create live_house" do
    assert_difference('LiveHouse.count') do
      post live_houses_url, params: { live_house: { name: @live_house.name } }
    end

    assert_redirected_to live_house_url(LiveHouse.last)
  end

  test "should show live_house" do
    get live_house_url(@live_house)
    assert_response :success
  end

  test "should get edit" do
    get edit_live_house_url(@live_house)
    assert_response :success
  end

  test "should update live_house" do
    patch live_house_url(@live_house), params: { live_house: { name: @live_house.name } }
    assert_redirected_to live_house_url(@live_house)
  end

  test "should destroy live_house" do
    assert_difference('LiveHouse.count', -1) do
      delete live_house_url(@live_house)
    end

    assert_redirected_to live_houses_url
  end
end
