require 'test_helper'

class ExperiencesControllerTest < ActionController::TestCase
  setup do
    @experience = experiences(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experiences)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience" do
    assert_difference('Experience.count') do
      post :create, experience: { [title: @experience.[title, authorId: @experience.authorId, createTime: @experience.createTime, endTime: @experience.endTime, privilege: @experience.privilege, startTime: @experience.startTime, text: @experience.text, type: @experience.type }
    end

    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should show experience" do
    get :show, id: @experience
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience
    assert_response :success
  end

  test "should update experience" do
    put :update, id: @experience, experience: { [title: @experience.[title, authorId: @experience.authorId, createTime: @experience.createTime, endTime: @experience.endTime, privilege: @experience.privilege, startTime: @experience.startTime, text: @experience.text, type: @experience.type }
    assert_redirected_to experience_path(assigns(:experience))
  end

  test "should destroy experience" do
    assert_difference('Experience.count', -1) do
      delete :destroy, id: @experience
    end

    assert_redirected_to experiences_path
  end
end
