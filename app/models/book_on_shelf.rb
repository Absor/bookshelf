class BookOnShelf < ActiveRecord::Base
  belongs_to :book
  belongs_to :shelf
end
