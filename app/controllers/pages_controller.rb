class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard]

  def stuk_to_do_home
    redirect_to stuk_todo_tasks_path if current_user
  end

  def estuk_home
    redirect_to stuk_books_path if current_user
    @stuk_books = StukBook.last(4)
  end

  def estuk_dashboard
    @stuk_books = current_user.stuk_books
  end
end
