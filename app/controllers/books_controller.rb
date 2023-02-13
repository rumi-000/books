class BooksController < ApplicationController
  
  def new
    # @book=Book.new
    # indexに記載をした
  end

  def create
    @book=Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book)
    else
      @books=Book.all
      render :index
    end
  end
  
  def index
    @books=Book.all
    @book=Book.new
  end

  def show
    @Book =Book.find(params[:id])
  end

  def edit
    @Book=Book.find(params[:id])
  end

  def update
    @Book=Book.find(params[:id])
    if @Book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@Book.id) 
   else
    render :edit
 end
 end
 
  def destroy
    @Book=Book.find(params[:id])
    @Book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end