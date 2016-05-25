class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :updated_by
      t.string :author
      t.integer :author_id
      t.integer :last_comment_id
      t.datetime :commented_at
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      # 回复过的人的 ids 列表
      t.integer :comment_user_ids, default: [], array: true
      # 最后回复人的用户名 - cache 字段用于减少列表也的查询
      t.string :last_commented_user_name
      # 删除人
      t.integer :who_deleted
      # 精华 0 否， 1 是
      t.integer :excellent, default: 0
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
