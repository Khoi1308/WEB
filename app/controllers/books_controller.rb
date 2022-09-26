class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    # render inline: 'Hello world', content_type: 'application/rss'
    @books = Book.find(params[:id])
  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
    @books = Book.find(params[:id])

    if @books.update(book_params)
      redirect_to @books
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :content)
  end
end
