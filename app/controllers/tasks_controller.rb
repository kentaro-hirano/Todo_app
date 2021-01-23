class TasksController < ApplicationController

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "追加に成功しました"
      redirect_to tasks_path
    else
      @tasks = Task.all
      render 'index'
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
     @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = "更新に成功しました"
      redirect_to tasks_path
    else
      render 'edit'
    end
  end

  def complete
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "完了しました"
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:success] = "削除に成功しました"
    redirect_to tasks_path
  end

  def destroy_all
    Task.destroy_all
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :body)
  end



end
