class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # we need this to instantiate the form
  end

  def create
    # we create and save the task from the params
    # after we send the params to a different method for safety
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
