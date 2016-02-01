class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :sub_name

      t.timestamps null: false
    end
  end
end
