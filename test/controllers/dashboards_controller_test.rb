require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get user_dashboard" do
    get dashboards_user_dashboard_url
    assert_response :success
  end

  test "should get owner_dashboard" do
    get dashboards_owner_dashboard_url
    assert_response :success
  end
end
