require 'test_helper'

class SupervisorProgressDeclarationsControllerTest < ActionController::TestCase
  setup do
    @supervisor_progress_declaration = supervisor_progress_declarations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supervisor_progress_declarations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create supervisor_progress_declaration" do
    assert_difference('SupervisorProgressDeclaration.count') do
      post :create, supervisor_progress_declaration: { date: @supervisor_progress_declaration.date, following_student_plan: @supervisor_progress_declaration.following_student_plan, phd_id: @supervisor_progress_declaration.phd_id, scientific_progress: @supervisor_progress_declaration.scientific_progress, supervisor_id: @supervisor_progress_declaration.supervisor_id }
    end

    assert_redirected_to supervisor_progress_declaration_path(assigns(:supervisor_progress_declaration))
  end

  test "should show supervisor_progress_declaration" do
    get :show, id: @supervisor_progress_declaration
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @supervisor_progress_declaration
    assert_response :success
  end

  test "should update supervisor_progress_declaration" do
    put :update, id: @supervisor_progress_declaration, supervisor_progress_declaration: { date: @supervisor_progress_declaration.date, following_student_plan: @supervisor_progress_declaration.following_student_plan, phd_id: @supervisor_progress_declaration.phd_id, scientific_progress: @supervisor_progress_declaration.scientific_progress, supervisor_id: @supervisor_progress_declaration.supervisor_id }
    assert_redirected_to supervisor_progress_declaration_path(assigns(:supervisor_progress_declaration))
  end

  test "should destroy supervisor_progress_declaration" do
    assert_difference('SupervisorProgressDeclaration.count', -1) do
      delete :destroy, id: @supervisor_progress_declaration
    end

    assert_redirected_to supervisor_progress_declarations_path
  end
end
