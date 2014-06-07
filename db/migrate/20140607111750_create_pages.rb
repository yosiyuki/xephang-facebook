class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :uid, null: false
      t.string :url, null: false
      t.string :name, null: false
      t.text :json, null: false
      t.integer :last_likes
      t.integer :prev_likes

      t.timestamps
    end

    add_index :pages, :uid
    add_index :pages, :url
    add_index :pages, :last_likes
  end
end
