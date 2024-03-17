class ToppagesController < ApplicationController
  def index
    if logged_in?
      @task = current_user.tasks.build  # form_with 用
      @pagy, @tasks = pagy(current_user.tasks.order(id: :desc))
    end
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @pagy, @tasks = pagy(current_user.tasks.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end 
  end 
  
  def destroy
    @task.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end 
  
  private
  
  def task_params
    params.require(:task).permit(:content,)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
  
end
