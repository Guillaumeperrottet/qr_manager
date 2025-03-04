require "test_helper"

class RedirectsControllerTest < ActionDispatch::IntegrationTest
  test "should get scan" do
    get redirects_scan_url
    assert_response :success
  end
end
