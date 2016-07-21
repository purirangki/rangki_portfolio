class StukBooksController < ApplicationController
  before_action :set_stuk_book, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  # GET /stuk_books
  # GET /stuk_books.json
  def index
    @stuk_books = StukBook.available
  end

  # GET /stuk_books/1
  # GET /stuk_books/1.json
  def show
  end

  # GET /stuk_books/new
  def new
    @stuk_book = StukBook.new
  end

  # GET /stuk_books/1/edit
  def edit
    authorize! :manage, @stuk_book
  end

  # POST /stuk_books
  # POST /stuk_books.json
  def create
    @stuk_book = current_user.stuk_books.new(stuk_book_params)

    respond_to do |format|
      if @stuk_book.save
        format.html { redirect_to @stuk_book, notice: 'Stuk book was successfully created.' }
        format.json { render :show, status: :created, location: @stuk_book }
      else
        format.html { render :new }
        format.json { render json: @stuk_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stuk_books/1
  # PATCH/PUT /stuk_books/1.json
  def update
    authorize! :manage, @stuk_book

    respond_to do |format|
      if @stuk_book.update(stuk_book_params)
        format.html { redirect_to @stuk_book, notice: 'Stuk book was successfully updated.' }
        format.json { render :show, status: :ok, location: @stuk_book }
      else
        format.html { render :edit }
        format.json { render json: @stuk_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stuk_books/1
  # DELETE /stuk_books/1.json
  def destroy
    authorize! :manage, @stuk_book

    @stuk_book.destroy
    respond_to do |format|
      format.html { redirect_to stuk_books_url, notice: 'Stuk book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stuk_book
      @stuk_book = StukBook.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stuk_book_params
      params.require(:stuk_book).permit(:name, :author, :description, :price, :availability, :image, :resource)
    end
end
