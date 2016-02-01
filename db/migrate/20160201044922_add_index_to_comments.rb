class AddIndexToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :subreddit, index: true, foreign_key: true
  end
end
