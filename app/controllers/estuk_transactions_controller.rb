class EstukTransactionsController
  def create
    book = StukBook.find_by!(slug: params[:slug])
    
    sale = book.e_stuk_sales.create(
      amount: book.price, 
      buyer_email: current_user.email, 
      seller_email: book.user.email, 
      stripe_token: params[:stripeToken])
    sale.process!

    if sale.finished?
      redirect_to pickup_url(guid: sale.guid)
    else
      redirect_to stuk_book_path(book), notice: @error
    end
  end

  def pickup
    @sale = EStukSale.find_by!(guid: params[:guid])
    @book = @sale.stuk_book
  end
end