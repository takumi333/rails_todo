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

  # おそらく、userのidとuser_idがまだ含まれていないため、保存ができない。
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: '保存しました'
    else
      flash.now[:error] = '保存に失敗しました'
      render new_task_path
    end
  end

  def update

  end

  def destory
    
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end

  def user_task
    @user_task = Task.find(params[:id])
  end
end
