require "application_system_test_case"

class CalculationsTest < ApplicationSystemTestCase
  setup do
    @calculation = calculations(:one)
  end

  test "visiting the index" do
    visit calculations_url
    assert_selector "h1", text: "Calculations"
  end

  test "should create calculation" do
    visit calculations_url
    click_on "New calculation"

    fill_in "Dep point", with: @calculation.dep_point
    fill_in "Dest point", with: @calculation.dest_point
    fill_in "Email", with: @calculation.email
    fill_in "Firstname", with: @calculation.firstname
    fill_in "Height", with: @calculation.height
    fill_in "Lastname", with: @calculation.lastname
    fill_in "Length", with: @calculation.length
    fill_in "Middlename", with: @calculation.middlename
    fill_in "Phone number", with: @calculation.phone_number
    fill_in "Weight", with: @calculation.weight
    fill_in "Width", with: @calculation.width
    click_on "Create Calculation"

    assert_text "Calculation was successfully created"
    click_on "Back"
  end

  test "should update Calculation" do
    visit calculation_url(@calculation)
    click_on "Edit this calculation", match: :first

    fill_in "Dep point", with: @calculation.dep_point
    fill_in "Dest point", with: @calculation.dest_point
    fill_in "Email", with: @calculation.email
    fill_in "Firstname", with: @calculation.firstname
    fill_in "Height", with: @calculation.height
    fill_in "Lastname", with: @calculation.lastname
    fill_in "Length", with: @calculation.length
    fill_in "Middlename", with: @calculation.middlename
    fill_in "Phone number", with: @calculation.phone_number
    fill_in "Weight", with: @calculation.weight
    fill_in "Width", with: @calculation.width
    click_on "Update Calculation"

    assert_text "Calculation was successfully updated"
    click_on "Back"
  end

  test "should destroy Calculation" do
    visit calculation_url(@calculation)
    click_on "Destroy this calculation", match: :first

    assert_text "Calculation was successfully destroyed"
  end
end
