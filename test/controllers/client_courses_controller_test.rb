require 'test_helper'

class ClientCoursesControllerTest < ActionController::TestCase
  setup do
    @client_course = client_courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_course" do
    assert_difference('ClientCourse.count') do
      post :create, client_course: { client_id: @client_course.client_id, course_id: @client_course.course_id }
    end

    assert_redirected_to client_course_path(assigns(:client_course))
  end

  test "should show client_course" do
    get :show, id: @client_course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_course
    assert_response :success
  end

  test "should update client_course" do
    patch :update, id: @client_course, client_course: { client_id: @client_course.client_id, course_id: @client_course.course_id }
    assert_redirected_to client_course_path(assigns(:client_course))
  end

  test "should destroy client_course" do
    assert_difference('ClientCourse.count', -1) do
      delete :destroy, id: @client_course
    end

    assert_redirected_to client_courses_path
  end
end
