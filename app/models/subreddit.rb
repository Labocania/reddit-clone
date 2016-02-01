class Subreddit < ActiveRecord::Base
    belongs_to :user
    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :sub_name, presence: true, length: { in: 1..10 }
    validates :description, presence: true, length: { maximum: 200 }
end
