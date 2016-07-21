class EstukTransactionsController
  def create
    book = StukBook.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin
      charge = Stripe::Charge.create(
        amount: book.price,
        currency: 'usd',
        card: token,
        description: current_user.email
      )
      @sale = book.e_stuk_sales.create!(buyer_email: current_user.email)
      redirect_to pickup_url(guid: @sale.guid)
    rescue Stripe::CardError => e
      @error = e
      redirect_to stuk_book_path(book), notice: @error
    end
  end

  def pickup
    @sale = EStukSale.find_by!(guid: params[:guid])
    @book = @sale.stuk_book
  end
end