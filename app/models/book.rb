class Book < ActiveRecord::Base
  has_many :book_on_shelves, dependent: :destroy
  has_many :shelves, through: :book_on_shelves
end
