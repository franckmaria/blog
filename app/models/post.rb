class Post < ApplicationRecord
  has_many :paragraphs
  belongs_to :user
  validates :title, presence: true
end
