class User < ApplicationRecord
    before_save {self.email.downcase!}
    validates :name, presence: true, length: {maximum: 50}
    validates :email, presence: true, length: {maximum: 255}, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },uniqueness: {case_sensitive: false}
    
    has_many :likes
    has_many :books, through: :likes, class_name: "Book" ,source: :book
    
    has_many :reviews
    has_many :review_books, through: :reviews, source: :book
    
    has_secure_password
    
    def like(book)
        self.likes.find_or_create_by(book_id: book.id)
    end
    
    def unlike(book)
        like = self.likes.find_by(book_id: book.id)
        like.destroy if like
    end
    
    def like?(book)
        self.books.include?(book)
    end
end
