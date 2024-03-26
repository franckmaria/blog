class Post < ApplicationRecord
  has_many :paragraphs
  belongs_to :user
  validates :title, presence: true

  def five_recent
    Post.all.order(created_at: :desc).limit(5)
  end

  def recent_all
    Post.all.order(created_at: :desc).limit(100)
  end
end
