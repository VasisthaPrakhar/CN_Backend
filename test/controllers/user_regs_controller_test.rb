require "test_helper"

class UserRegsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_reg = user_regs(:one)
  end

  test "should get index" do
    get user_regs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_reg_url
    assert_response :success
  end

  test "should create user_reg" do
    assert_difference("UserReg.count") do
      post user_regs_url, params: { user_reg: { email: @user_reg.email, name: @user_reg.name } }
    end

    assert_redirected_to user_reg_url(UserReg.last)
  end

  test "should show user_reg" do
    get user_reg_url(@user_reg)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_reg_url(@user_reg)
    assert_response :success
  end

  test "should update user_reg" do
    patch user_reg_url(@user_reg), params: { user_reg: { email: @user_reg.email, name: @user_reg.name } }
    assert_redirected_to user_reg_url(@user_reg)
  end

  test "should destroy user_reg" do
    assert_difference("UserReg.count", -1) do
      delete user_reg_url(@user_reg)
    end

    assert_redirected_to user_regs_url
  end
end
