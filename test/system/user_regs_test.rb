require "application_system_test_case"

class UserRegsTest < ApplicationSystemTestCase
  setup do
    @user_reg = user_regs(:one)
  end

  test "visiting the index" do
    visit user_regs_url
    assert_selector "h1", text: "User regs"
  end

  test "should create user reg" do
    visit user_regs_url
    click_on "New user reg"

    fill_in "Email", with: @user_reg.email
    fill_in "Name", with: @user_reg.name
    click_on "Create User reg"

    assert_text "User reg was successfully created"
    click_on "Back"
  end

  test "should update User reg" do
    visit user_reg_url(@user_reg)
    click_on "Edit this user reg", match: :first

    fill_in "Email", with: @user_reg.email
    fill_in "Name", with: @user_reg.name
    click_on "Update User reg"

    assert_text "User reg was successfully updated"
    click_on "Back"
  end

  test "should destroy User reg" do
    visit user_reg_url(@user_reg)
    click_on "Destroy this user reg", match: :first

    assert_text "User reg was successfully destroyed"
  end
end
