class StukStarterProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  
  def index
    @stuk_starter_projects = StukStarterProject.all
    @displayed_projects = StukStarterProject.take(4)
  end

  def show
    @stuk_starter_rewards = @stuk_starter_project.stuk_starter_rewards
  end

  def new
    @stuk_starter_project = StukStarterProject.new
  end

  def edit
  end

  def create
    @stuk_starter_project = current_user.stuk_starter_projects.build(project_params)

    respond_to do |format|
      if @stuk_starter_project.save
        format.html { redirect_to @stuk_starter_project, notice: 'Project was successfully created' }
        format.json { render :show, status: :ok, location: @stuk_starter_project }
      else
        format.html { redirect_to :edit }
        format.json { render json: @stuk_starter_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stuk_starter_project.update(project_params)
        format.html { redirect_to @stuk_starter_project, notice: 'Project was successfully updated' }
        format.json { render :show, status: :ok, location: @stuk_starter_project }
      else
        format.html { redirect_to :edit }
        format.json { render json: @stuk_starter_project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stuk_starter_project.destroy
    respond_to do |format|
      format.html { redirect_to project_path, notice: 'Project was successfully deleted' }
      format.json { head :no_content }
    end
  end


  private

    def set_project
      @stuk_starter_project = StukStarterProject.find(params[:id])
    end

    def project_params
      params.require(:stuk_starter_project).permit(:name, :short_description, :description, :goal, :image_url, :expiration_date)
    end

end
