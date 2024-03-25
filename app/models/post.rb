class Post < ApplicationRecord
  has_many :paragraphs

  validates :title, presence: true
end
