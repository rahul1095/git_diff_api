require "test_helper"

class CommitsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get commits_show_url
    assert_response :success
  end

  test "should get compare" do
    get commits_compare_url
    assert_response :success
  end

  test "should get index" do
    get commits_index_url
    assert_response :success
  end
end
