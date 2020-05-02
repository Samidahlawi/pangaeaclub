require 'test_helper'

class ItemNotIncludedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_not_included = item_not_includeds(:one)
  end

  test "should get index" do
    get item_not_includeds_url
    assert_response :success
  end

  test "should get new" do
    get new_item_not_included_url
    assert_response :success
  end

  test "should create item_not_included" do
    assert_difference('ItemNotIncluded.count') do
      post item_not_includeds_url, params: { item_not_included: { description: @item_not_included.description, item: @item_not_included.item } }
    end

    assert_redirected_to item_not_included_url(ItemNotIncluded.last)
  end

  test "should show item_not_included" do
    get item_not_included_url(@item_not_included)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_not_included_url(@item_not_included)
    assert_response :success
  end

  test "should update item_not_included" do
    patch item_not_included_url(@item_not_included), params: { item_not_included: { description: @item_not_included.description, item: @item_not_included.item } }
    assert_redirected_to item_not_included_url(@item_not_included)
  end

  test "should destroy item_not_included" do
    assert_difference('ItemNotIncluded.count', -1) do
      delete item_not_included_url(@item_not_included)
    end

    assert_redirected_to item_not_includeds_url
  end
end
