class DigitalAssets::GithubDataController < ApplicationController

  def show
    @github_profile = current_digital_asset.github_profile
  end
end
