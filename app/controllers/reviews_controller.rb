class ReviewsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destory]
  
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params, user_id:current_user, book_id:params[:book_id])
    
    if @review
      flash[:success] = "レビューを投稿しました。"
      redirect_to "/books/{params[:book_id]}"
    else
      flash[:danger] = "レビューの投稿に失敗しました。"
      render "reviews/new"
    end
  end

  def destory
    @review.destory
    flash[:success] = "レビューを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def review_params
    params.require(:review).permit(:content)
  end
  
  def correct_user
    @review = Review.find_by(id: params[:id])
    
    if @review.user_id != current_user.id
      redirect_to root_url
    end
  end
end
