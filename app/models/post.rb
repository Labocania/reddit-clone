class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :subreddit
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { in: 1..50 }
  validates :url, presence: true, length: { maximum: 140 }, format: { without: /\A[h]t{2}[p]:{1}\D{2}/, message: "Take the http:// out of the url"}
end
