class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
       redirect_to book_path(book.id)
    else
      @book = Book.new
      render :new
    end
  end


  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to new_book_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
