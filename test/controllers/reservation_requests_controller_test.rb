require "test_helper"

class ReservationRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservation_requests_new_url
    assert_response :success
  end

  test "should get index" do
    get reservation_requests_index_url
    assert_response :success
  end

  test "should get show" do
    get reservation_requests_show_url
    assert_response :success
  end

  test "should get edit" do
    get reservation_requests_edit_url
    assert_response :success
  end
end
