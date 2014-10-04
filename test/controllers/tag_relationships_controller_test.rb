require 'test_helper'

class TagRelationshipsControllerTest < ActionController::TestCase
  setup do
    @tag_relationship = tag_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tag_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tag_relationship" do
    assert_difference('TagRelationship.count') do
      post :create, tag_relationship: {  }
    end

    assert_redirected_to tag_relationship_path(assigns(:tag_relationship))
  end

  test "should show tag_relationship" do
    get :show, id: @tag_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tag_relationship
    assert_response :success
  end

  test "should update tag_relationship" do
    patch :update, id: @tag_relationship, tag_relationship: {  }
    assert_redirected_to tag_relationship_path(assigns(:tag_relationship))
  end

  test "should destroy tag_relationship" do
    assert_difference('TagRelationship.count', -1) do
      delete :destroy, id: @tag_relationship
    end

    assert_redirected_to tag_relationships_path
  end
end
