class PagesController < ApplicationController
  def home
    redirect_to stuk_todo_tasks_path if current_user
  end

  def about
    
  end
end
