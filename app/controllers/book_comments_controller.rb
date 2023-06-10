class BookCommentsController < ApplicationController
  def create
    book_comment = Book.find(params[:book_comment_id])
    comment = current_user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to books_path(book)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
