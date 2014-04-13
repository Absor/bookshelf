class Shelf < ActiveRecord::Base
  belongs_to :user

  before_validation :default_values

  validates :name, presence: true

  private

  def default_values
    self.name = 'A bookshelf' if self.name.nil?
  end
end
