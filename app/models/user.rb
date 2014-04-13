class User < ActiveRecord::Base
  include Security
  # Others available are: :confirmable, :lockable, :rememberable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :shelves
end
