class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
   if book.save
    flash[:notice] = "successfully"
    redirect_to book_path(book.id)
   else
    flash.now[:alert] = "error"
    @book = book
    @books = Book.all
    render :index
   end
  end

  def index
    @book = Book.new
    @books = Book.all
  end
  # モデル名.find(params[:id])でid部分の情報をparamsでfindに渡す
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
  if book.update(book_params)
   flash[:notice] = "successfully"
   redirect_to book_path(book.id)
  else
   flash.now[:alert] = "error"
   @book = book
   @books = Book.all
   render :index
   end
  end

  def destroy
    book = Book.find(params[:id])
   if book.destroy
    flash[:notice] = "successfully"
    redirect_to books_path
    #redirect_toはURLに転送するためbooks_pathで指定している
   else
    flash.now[:alert] = "error"
    @book = book　#@book = book 質問する
    @books = Book.all
    render :index
    #renderはindexのviewを表示するため、controller内のindexの
    #@book = Book.newと@books = Book.allを定義する
   end
  end

  private

  def set_book
  end

  # book_paramsはモデル内の情報を作っている。
  # requireでモデル名を指定。
  # permitはデータのカラムを作成している
  def book_params
   params.require(:book).permit(:title, :body)
  end
end