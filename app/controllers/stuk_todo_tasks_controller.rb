class StukTodoTasksController < ApplicationController
  before_action :set_stuk_todo_task, only: [:show, :edit, :update, :destroy, :change]
  before_action :authenticate_user!

  # GET /stuk_todo_tasks
  # GET /stuk_todo_tasks.json
  def index
    @to_do = current_user.stuk_todo_tasks.where(state: 'to_do')
    @doing = current_user.stuk_todo_tasks.where(state: 'doing')
    @done = current_user.stuk_todo_tasks.where(state: 'done')
  end

  # GET /stuk_todo_tasks/1
  # GET /stuk_todo_tasks/1.json
  def show
  end

  # GET /stuk_todo_tasks/new
  def new
    @stuk_todo_task = StukTodoTask.new
  end

  # GET /stuk_todo_tasks/1/edit
  def edit
  end

  # POST /stuk_todo_tasks
  # POST /stuk_todo_tasks.json
  def create
    @stuk_todo_task = current_user.stuk_todo_tasks.new(stuk_todo_task_params)

    respond_to do |format|
      if @stuk_todo_task.save
        format.html { redirect_to @stuk_todo_task, notice: 'Stuk todo task was successfully created.' }
        format.json { render :show, status: :created, location: @stuk_todo_task }
      else
        format.html { render :new }
        format.json { render json: @stuk_todo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuk_todo_tasks/1
  # PATCH/PUT /stuk_todo_tasks/1.json
  def update
    respond_to do |format|
      if @stuk_todo_task.update(stuk_todo_task_params)
        format.html { redirect_to @stuk_todo_task, notice: 'Stuk todo task was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuk_todo_task }
      else
        format.html { render :edit }
        format.json { render json: @stuk_todo_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuk_todo_tasks/1
  # DELETE /stuk_todo_tasks/1.json
  def destroy
    @stuk_todo_task.destroy
    respond_to do |format|
      format.html { redirect_to stuk_todo_tasks_url, notice: 'Stuk todo task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @stuk_todo_task.update_attributes(state: params[:state])
    respond_to do |format|
      format.html { redirect_to stuk_todo_tasks_path, notice: 'Task status successfully changed!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuk_todo_task
      @stuk_todo_task = StukTodoTask.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuk_todo_task_params
      params.require(:stuk_todo_task).permit(:content, :state)
    end
end
