class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true, length: { in: 1..15 }
  has_many :subreddits, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
