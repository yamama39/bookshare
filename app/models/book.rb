class Book < ApplicationRecord
    validates :title, presence: true, length: {maximum: 255}
    validates :isbn, presence: true, length: {maximum: 255}
    validates :url, presence: true, length: {maximum: 255}
    validates :image_url, presence: true, length: {maximum: 255}
    validates :author, presence: true, length: {maximum: 255}
    validates :publisher_name, presence: true, length: {maximum: 255}
    
    has_many :likes
    has_many :users, through: :likes, class_name: "User" , source: :user
    
    has_many :reviews
    has_many :review_user, through: :reviews, source: :user
end
