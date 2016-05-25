class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :face_file_name #头像
      t.string :face_content_type
      t.integer :face_file_size
      t.datetime :face_updated_at
      t.string :dynasty
      t.string :birthday
      t.text :description
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
