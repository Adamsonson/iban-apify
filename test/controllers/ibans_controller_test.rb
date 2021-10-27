require "test_helper"

class IbansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ibans_index_url
    assert_response :success
  end
end
