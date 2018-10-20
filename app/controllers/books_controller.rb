class BooksController < ApplicationController
  before_action :require_user_logged_in
  
  def new
    
    @books = []
    
    @title = params[:title]
    if @title.present?
      results = RakutenWebService::Books::Book.search({
        title: @title,
        imageFlag: 1,
        hits: 20,
      })
    
      results.each do |result|
        book = Book.find_or_initialize_by(read(result))
        @books << book
      end
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
end
