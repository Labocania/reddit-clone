class RemoveIdsFromSubredditsUsers < ActiveRecord::Migration
  def change
    drop_table :subreddits_users
  end
end
