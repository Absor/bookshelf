class Shelf < ActiveRecord::Base
  belongs_to :user
  has_many :book_on_shelves, dependent: :destroy
  has_many :books, through: :book_on_shelves

  before_validation :default_values

  validates :name, presence: true

  private

  def default_values
    self.name = 'A bookshelf' if self.name.nil?
  end
end
