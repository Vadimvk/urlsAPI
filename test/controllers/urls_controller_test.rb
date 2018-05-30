require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get urls_create_url
    assert_response :success
  end

  test "should get check_url" do
    get urls_check_url_url
    assert_response :success
  end

end
