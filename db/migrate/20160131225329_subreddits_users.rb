class SubredditsUsers < ActiveRecord::Migration
  def change
    create_table :subreddits_users, id: false do |t|
      t.belongs_to :subreddit, index: true
      t.belongs_to :user, index: true
    end
  end
end
