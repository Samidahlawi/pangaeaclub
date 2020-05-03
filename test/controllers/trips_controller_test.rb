require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:one)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { bg_image: @trip.bg_image, country: @trip.country, deadline: @trip.deadline, description: @trip.description, destination: @trip.destination, duration: @trip.duration, end_date: @trip.end_date, group_size_end: @trip.group_size_end, group_size_start: @trip.group_size_start, guide_id: @trip.guide_id, image: @trip.image, level: @trip.level, price: @trip.price, region_id: @trip.region_id, start_date: @trip.start_date, sub_title: @trip.sub_title, title: @trip.title, trip_type: @trip.trip_type } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { bg_image: @trip.bg_image, country: @trip.country, deadline: @trip.deadline, description: @trip.description, destination: @trip.destination, duration: @trip.duration, end_date: @trip.end_date, group_size_end: @trip.group_size_end, group_size_start: @trip.group_size_start, guide_id: @trip.guide_id, image: @trip.image, level: @trip.level, price: @trip.price, region_id: @trip.region_id, start_date: @trip.start_date, sub_title: @trip.sub_title, title: @trip.title, trip_type: @trip.trip_type } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
