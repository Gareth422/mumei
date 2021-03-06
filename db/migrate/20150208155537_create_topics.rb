class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics, comment:'topic of discussion, also called thread' do |t|
      t.string :title, comment:'title'
      t.references :board, index: true

      t.timestamps null: false
    end
    add_foreign_key :topics, :boards
  end
end
