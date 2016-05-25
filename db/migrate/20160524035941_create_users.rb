class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :encrypted_password
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip
      t.string :face_file_name #头像
      t.string :face_content_type
      t.integer :face_file_size
      t.datetime :face_updated_at
      t.integer :genre, default: 1
      t.datetime :face_updated_at
      t.timestamps
    end
  end
end
