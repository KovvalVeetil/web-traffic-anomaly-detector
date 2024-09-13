require "test_helper"

class AnomaliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anomalies_index_url
    assert_response :success
  end

  test "should get show" do
    get anomalies_show_url
    assert_response :success
  end
end
