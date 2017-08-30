require 'test_helper'

class GithubProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @github_profile = github_profiles(:one)
  end

  test "should get index" do
    get github_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_github_profile_url
    assert_response :success
  end

  test "should create github_profile" do
    assert_difference('GithubProfile.count') do
      post github_profiles_url, params: { github_profile: { digital_asset_id: @github_profile.digital_asset_id, url: @github_profile.url } }
    end

    assert_redirected_to github_profile_url(GithubProfile.last)
  end

  test "should show github_profile" do
    get github_profile_url(@github_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_github_profile_url(@github_profile)
    assert_response :success
  end

  test "should update github_profile" do
    patch github_profile_url(@github_profile), params: { github_profile: { digital_asset_id: @github_profile.digital_asset_id, url: @github_profile.url } }
    assert_redirected_to github_profile_url(@github_profile)
  end

  test "should destroy github_profile" do
    assert_difference('GithubProfile.count', -1) do
      delete github_profile_url(@github_profile)
    end

    assert_redirected_to github_profiles_url
  end
end
