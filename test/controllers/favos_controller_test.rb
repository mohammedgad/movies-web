require 'test_helper'

class FavosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get favos_index_url
    assert_response :success
  end

  test "should get create" do
    get favos_create_url
    assert_response :success
  end

  test "should get destroy" do
    get favos_destroy_url
    assert_response :success
  end

end
