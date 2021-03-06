class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:estuk_dashboard, :stuk_places_dashboard]

  def stuk_todo_home
    redirect_to stuk_todo_tasks_path if current_user
  end

  def estuk_home
    redirect_to stuk_books_path if current_user
    @stuk_books = StukBook.last(4)
  end

  def estuk_dashboard
    @stuk_books = current_user.stuk_books
    @purchased = EStukSale.where(buyer_email: current_user.email)
    @sales = EStukSale.where(seller_email: current_user.email)
  end

  def stuk_starter_home
    @stuk_starter_projects = StukStarterProject.all
    @displayed_projects = StukStarterProject.take(4)
  end

  def stuk_places_home
    redirect_to stuk_places_dashboard_path if current_user
  end

  def stuk_places_dashboard
    @user = current_user
    @places = @user.places
    @places_reviews = @user.places_reviews
  end
end
