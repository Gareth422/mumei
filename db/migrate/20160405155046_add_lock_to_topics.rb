class AddLockToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :locked, :boolean, default: false, null: false, after: :max_pos, comment:'prevent further replies'
  end
end
