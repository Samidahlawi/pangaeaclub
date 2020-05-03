require "application_system_test_case"

class ItemIncludedsTest < ApplicationSystemTestCase
  setup do
    @item_included = item_includeds(:one)
  end

  test "visiting the index" do
    visit item_includeds_url
    assert_selector "h1", text: "Item Includeds"
  end

  test "creating a Item included" do
    visit item_includeds_url
    click_on "New Item Included"

    fill_in "Description", with: @item_included.description
    fill_in "Title", with: @item_included.title
    fill_in "Trip", with: @item_included.trip_id
    click_on "Create Item included"

    assert_text "Item included was successfully created"
    click_on "Back"
  end

  test "updating a Item included" do
    visit item_includeds_url
    click_on "Edit", match: :first

    fill_in "Description", with: @item_included.description
    fill_in "Title", with: @item_included.title
    fill_in "Trip", with: @item_included.trip_id
    click_on "Update Item included"

    assert_text "Item included was successfully updated"
    click_on "Back"
  end

  test "destroying a Item included" do
    visit item_includeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item included was successfully destroyed"
  end
end
