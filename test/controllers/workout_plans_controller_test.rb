require "test_helper"

class WorkoutPlansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workout_plans_index_url
    assert_response :success
  end

  test "should get show" do
    get workout_plans_show_url
    assert_response :success
  end

  test "should get new" do
    get workout_plans_new_url
    assert_response :success
  end

  test "should get edit" do
    get workout_plans_edit_url
    assert_response :success
  end
end
