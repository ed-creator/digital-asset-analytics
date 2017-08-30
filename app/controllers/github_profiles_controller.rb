class GithubProfilesController < ApplicationController
  before_action :set_github_profile, only: [:show, :edit, :update, :destroy]

  # GET /github_profiles
  # GET /github_profiles.json
  def index
    @github_profiles = GithubProfile.all
  end

  # GET /github_profiles/1
  # GET /github_profiles/1.json
  def show
  end

  # GET /github_profiles/new
  def new
    @github_profile = GithubProfile.new
  end

  # GET /github_profiles/1/edit
  def edit
  end

  # POST /github_profiles
  # POST /github_profiles.json
  def create
    @github_profile = GithubProfile.new(github_profile_params)

    respond_to do |format|
      if @github_profile.save
        format.html { redirect_to @github_profile, notice: 'Github profile was successfully created.' }
        format.json { render :show, status: :created, location: @github_profile }
      else
        format.html { render :new }
        format.json { render json: @github_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /github_profiles/1
  # PATCH/PUT /github_profiles/1.json
  def update
    respond_to do |format|
      if @github_profile.update(github_profile_params)
        format.html { redirect_to @github_profile, notice: 'Github profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @github_profile }
      else
        format.html { render :edit }
        format.json { render json: @github_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /github_profiles/1
  # DELETE /github_profiles/1.json
  def destroy
    @github_profile.destroy
    respond_to do |format|
      format.html { redirect_to github_profiles_url, notice: 'Github profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_profile
      @github_profile = GithubProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def github_profile_params
      params.require(:github_profile).permit(:link, :digital_asset_id)
    end
end
