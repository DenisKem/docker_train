class ReleasesController < ApplicationController
  before_action :set_project, only: [:index, :create]
  before_action :set_release, only: [:show, :edit, :update, :destroy, :build, :start, :stop]

  # GET /releases
  # GET /releases.json
  def index
    @releases = @project.releases.fresh_first
  end

  # GET /releases/1
  # GET /releases/1.json
  def show
  end

  # GET /releases/new
  def new
    @release = Release.new
  end

  # GET /releases/1/edit
  def edit
  end

  # POST /releases
  # POST /releases.json
  def create
    @release = @project.make_new_release


    respond_to do |format|
      if @release.save
        format.html { redirect_to  project_releases_path(@project), notice: 'Release was successfully created.' }
        format.json { render :show, status: :created, location: @release }
      else
        format.html { render :new }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  def build
    @release.build!

    respond_to do |format|
      format.html { redirect_to  (request.referrer || project_releases_path(@project)), notice: 'Release building was successfully started.' }
    end
  end

  def start
    @release.start!

    respond_to do |format|
      format.html { redirect_to  (request.referrer || project_releases_path(@project)), notice: 'Release running was successfully started.' }
    end
  end

  def stop
    @release.stop!

    respond_to do |format|
      format.html { redirect_to  (request.referrer || project_releases_path(@project)), notice: 'Release stooped was successfully started.' }
    end
  end


  # PATCH/PUT /releases/1
  # PATCH/PUT /releases/1.json
  def update
    respond_to do |format|
      if @release.update(release_params)
        format.html { redirect_to @release, notice: 'Release was successfully updated.' }
        format.json { render :show, status: :ok, location: @release }
      else
        format.html { render :edit }
        format.json { render json: @release.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /releases/1
  # DELETE /releases/1.json
  def destroy
    @release.destroy
    respond_to do |format|
      format.html { redirect_to project_releases_path(@release.project), notice: 'Release was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_project
    @project = Project.find params[:project_id]
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_release
    @release = Release.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def release_params
    params.fetch(:release, {})
  end
end
