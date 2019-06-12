require "application_system_test_case"

class LiveHousesTest < ApplicationSystemTestCase
  setup do
    @live_house = live_houses(:one)
  end

  test "visiting the index" do
    visit live_houses_url
    assert_selector "h1", text: "Live Houses"
  end

  test "creating a Live house" do
    visit live_houses_url
    click_on "New Live House"

    fill_in "Name", with: @live_house.name
    click_on "Create Live house"

    assert_text "Live house was successfully created"
    click_on "Back"
  end

  test "updating a Live house" do
    visit live_houses_url
    click_on "Edit", match: :first

    fill_in "Name", with: @live_house.name
    click_on "Update Live house"

    assert_text "Live house was successfully updated"
    click_on "Back"
  end

  test "destroying a Live house" do
    visit live_houses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Live house was successfully destroyed"
  end
end
