class TasksController < ApplicationController
  before_action :user_task, only: [:show, :destroy]

  def index
    @tasks = Task.all.includes(:user)
  end

  def new
    @task = Task.new
  end

  def show;end

  def edit
    @task = Task.find(params[:id])
  end

  # おそらく、userのidとuser_idがまだ含まれていないため、保存ができない。
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to tasks_path, notice: '保存しました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: '保存しました'
    else
      flash.now[:error] = '保存に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_task.destroy!
    redirect_to tasks_path, notice: '削除しました'
  end

  private
  def task_params
    params.require(:task).permit(:title, :description)
  end

  def user_task
    @user_task = Task.find(params[:id])
  end
end
