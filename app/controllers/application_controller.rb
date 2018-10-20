class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  include SessionsHelper
  
  private
  
  def require_user_logged_in
    unless logged_in?
        redirect_to root_url
    end
  end
  
  def read(result)
    title = result['title']
    isbn = result['isbn']
    url = result['itemUrl']
    image_url = result['mediumImageUrl'].gsub('?_ex=120x120', '')
    author = result['author']
    publisher_name = result['publisherName']
    
    {
      title: title,
      isbn: isbn,
      url: url,
      image_url: image_url,
      author: author,
      publisher_name: publisher_name,
    }
    
  end
end
