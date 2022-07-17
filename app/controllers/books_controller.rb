class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:success]="Book was successfully created."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :new
    end
  end

  def index
    @books = Book.all
    @book = Book.new


  end

  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.all
    @book.save
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success]="Book was successfully updated."
    redirect_to book_path(@book.id)
    else
    @books = Book.all
    render :books #edit
    end
    @books = Book.all
  end

  def destroy
    @book = Book.find(params[:id])
    @book.delete
    redirect_to '/books'
  end


   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
