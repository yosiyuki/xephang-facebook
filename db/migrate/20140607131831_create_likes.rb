class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :page_id, null: false
      t.text :data

      t.timestamps
    end

    add_index :likes, :page_id
  end
end
