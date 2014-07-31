require 'test_helper'

class AngtestControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
