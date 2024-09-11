require "test_helper"

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get site_home_url
    assert_response :success
  end

  test "should get about_us" do
    get site_about_us_url
    assert_response :success
  end
end
