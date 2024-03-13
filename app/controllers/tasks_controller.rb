class TasksController < ApplicationController
  before_action :user_task, only: [:show, :edit]

  def index
    @tasks = Task.all.includes(:user)
  end

  def new
    @task = Task.new
  end

  def show

  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    if @task.create
      redirect_to tasks_path, notice: '保存しました'
    else
      render new_task_path, notice: '保存に失敗しました'
    end
  end

  def updated

  end

  def destory
    
  end

  private
  def task_params
    params.require(:tasks).permit(:user_id, :title, :description)
  end

  def user_task
    @user_task = Task.find(params[:id])
  end
end
