require "test_helper"

class RepositoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get repositories_show_url
    assert_response :success
  end

  test "should get branches" do
    get repositories_branches_url
    assert_response :success
  end
end
