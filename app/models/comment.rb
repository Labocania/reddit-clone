class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  validates :comment_description, presence: true, length: { maximum: 400 }
end
