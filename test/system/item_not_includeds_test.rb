require "application_system_test_case"

class ItemNotIncludedsTest < ApplicationSystemTestCase
  setup do
    @item_not_included = item_not_includeds(:one)
  end

  test "visiting the index" do
    visit item_not_includeds_url
    assert_selector "h1", text: "Item Not Includeds"
  end

  test "creating a Item not included" do
    visit item_not_includeds_url
    click_on "New Item Not Included"

    fill_in "Description", with: @item_not_included.description
    fill_in "Item", with: @item_not_included.item
    fill_in "Trip", with: @item_not_included.trip_id
    click_on "Create Item not included"

    assert_text "Item not included was successfully created"
    click_on "Back"
  end

  test "updating a Item not included" do
    visit item_not_includeds_url
    click_on "Edit", match: :first

    fill_in "Description", with: @item_not_included.description
    fill_in "Item", with: @item_not_included.item
    fill_in "Trip", with: @item_not_included.trip_id
    click_on "Update Item not included"

    assert_text "Item not included was successfully updated"
    click_on "Back"
  end

  test "destroying a Item not included" do
    visit item_not_includeds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item not included was successfully destroyed"
  end
end
