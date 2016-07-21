class PagesController < ApplicationController
  def stuk_to_do_home
    redirect_to stuk_todo_tasks_path if current_user
  end

  def estuk_home
    redirect_to stuk_books_path if current_user
  end
end
