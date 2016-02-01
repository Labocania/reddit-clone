class AddDescriptionToSubreddits < ActiveRecord::Migration
  def change
    add_column :subreddits, :description, :text
  end
end
