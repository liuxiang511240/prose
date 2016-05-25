class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :outer_id
      t.integer :genre
      t.integer :user_id
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
