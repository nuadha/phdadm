require 'test_helper'

class PhdSupervisorRelationsControllerTest < ActionController::TestCase
  setup do
    @phd_supervisor_relation = phd_supervisor_relations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phd_supervisor_relations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phd_supervisor_relation" do
    assert_difference('PhdSupervisorRelation.count') do
      post :create, phd_supervisor_relation: { phd_id: @phd_supervisor_relation.phd_id, supervisor_id: @phd_supervisor_relation.supervisor_id }
    end

    assert_redirected_to phd_supervisor_relation_path(assigns(:phd_supervisor_relation))
  end

  test "should show phd_supervisor_relation" do
    get :show, id: @phd_supervisor_relation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phd_supervisor_relation
    assert_response :success
  end

  test "should update phd_supervisor_relation" do
    put :update, id: @phd_supervisor_relation, phd_supervisor_relation: { phd_id: @phd_supervisor_relation.phd_id, supervisor_id: @phd_supervisor_relation.supervisor_id }
    assert_redirected_to phd_supervisor_relation_path(assigns(:phd_supervisor_relation))
  end

  test "should destroy phd_supervisor_relation" do
    assert_difference('PhdSupervisorRelation.count', -1) do
      delete :destroy, id: @phd_supervisor_relation
    end

    assert_redirected_to phd_supervisor_relations_path
  end
end
