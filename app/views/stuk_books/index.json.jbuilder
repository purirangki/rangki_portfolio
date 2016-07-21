json.array!(@stuk_books) do |stuk_book|
  json.extract! stuk_book, :id, :name, :author, :description, :price, :availability
  json.url stuk_book_url(stuk_book, format: :json)
end
