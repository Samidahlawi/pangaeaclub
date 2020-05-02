require 'test_helper'

class GuidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guide = guides(:one)
  end

  test "should get index" do
    get guides_url
    assert_response :success
  end

  test "should get new" do
    get new_guide_url
    assert_response :success
  end

  test "should create guide" do
    assert_difference('Guide.count') do
      post guides_url, params: { guide: { country: @guide.country, description: @guide.description, first_name: @guide.first_name, hobby: @guide.hobby, instagram: @guide.instagram, last_name: @guide.last_name, position: @guide.position, profile_image: @guide.profile_image } }
    end

    assert_redirected_to guide_url(Guide.last)
  end

  test "should show guide" do
    get guide_url(@guide)
    assert_response :success
  end

  test "should get edit" do
    get edit_guide_url(@guide)
    assert_response :success
  end

  test "should update guide" do
    patch guide_url(@guide), params: { guide: { country: @guide.country, description: @guide.description, first_name: @guide.first_name, hobby: @guide.hobby, instagram: @guide.instagram, last_name: @guide.last_name, position: @guide.position, profile_image: @guide.profile_image } }
    assert_redirected_to guide_url(@guide)
  end

  test "should destroy guide" do
    assert_difference('Guide.count', -1) do
      delete guide_url(@guide)
    end

    assert_redirected_to guides_url
  end
end
