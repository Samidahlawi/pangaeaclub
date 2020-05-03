require "application_system_test_case"

class TripsTest < ApplicationSystemTestCase
  setup do
    @trip = trips(:one)
  end

  test "visiting the index" do
    visit trips_url
    assert_selector "h1", text: "Trips"
  end

  test "creating a Trip" do
    visit trips_url
    click_on "New Trip"

    fill_in "Bg image", with: @trip.bg_image
    fill_in "Country", with: @trip.country
    fill_in "Deadline", with: @trip.deadline
    fill_in "Description", with: @trip.description
    fill_in "Destination", with: @trip.destination
    fill_in "Duration", with: @trip.duration
    fill_in "End date", with: @trip.end_date
    fill_in "Group size end", with: @trip.group_size_end
    fill_in "Group size start", with: @trip.group_size_start
    fill_in "Guide", with: @trip.guide_id
    fill_in "Image", with: @trip.image
    fill_in "Level", with: @trip.level
    fill_in "Price", with: @trip.price
    fill_in "Region", with: @trip.region_id
    fill_in "Start date", with: @trip.start_date
    fill_in "Sub title", with: @trip.sub_title
    fill_in "Title", with: @trip.title
    fill_in "Trip type", with: @trip.trip_type
    click_on "Create Trip"

    assert_text "Trip was successfully created"
    click_on "Back"
  end

  test "updating a Trip" do
    visit trips_url
    click_on "Edit", match: :first

    fill_in "Bg image", with: @trip.bg_image
    fill_in "Country", with: @trip.country
    fill_in "Deadline", with: @trip.deadline
    fill_in "Description", with: @trip.description
    fill_in "Destination", with: @trip.destination
    fill_in "Duration", with: @trip.duration
    fill_in "End date", with: @trip.end_date
    fill_in "Group size end", with: @trip.group_size_end
    fill_in "Group size start", with: @trip.group_size_start
    fill_in "Guide", with: @trip.guide_id
    fill_in "Image", with: @trip.image
    fill_in "Level", with: @trip.level
    fill_in "Price", with: @trip.price
    fill_in "Region", with: @trip.region_id
    fill_in "Start date", with: @trip.start_date
    fill_in "Sub title", with: @trip.sub_title
    fill_in "Title", with: @trip.title
    fill_in "Trip type", with: @trip.trip_type
    click_on "Update Trip"

    assert_text "Trip was successfully updated"
    click_on "Back"
  end

  test "destroying a Trip" do
    visit trips_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Trip was successfully destroyed"
  end
end
