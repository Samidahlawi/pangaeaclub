require 'test_helper'

class ItemIncludedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_included = item_includeds(:one)
  end

  test "should get index" do
    get item_includeds_url
    assert_response :success
  end

  test "should get new" do
    get new_item_included_url
    assert_response :success
  end

  test "should create item_included" do
    assert_difference('ItemIncluded.count') do
      post item_includeds_url, params: { item_included: { description: @item_included.description, title: @item_included.title } }
    end

    assert_redirected_to item_included_url(ItemIncluded.last)
  end

  test "should show item_included" do
    get item_included_url(@item_included)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_included_url(@item_included)
    assert_response :success
  end

  test "should update item_included" do
    patch item_included_url(@item_included), params: { item_included: { description: @item_included.description, title: @item_included.title } }
    assert_redirected_to item_included_url(@item_included)
  end

  test "should destroy item_included" do
    assert_difference('ItemIncluded.count', -1) do
      delete item_included_url(@item_included)
    end

    assert_redirected_to item_includeds_url
  end
end
