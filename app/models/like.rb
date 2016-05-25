#喜欢
class Like < ActiveRecord::Base
  include SoftDelete
  attr_accessible :outer_id, :genre, :user_id, :deleted_at, :created_at, :updated_at
  belongs_to :user, inverse_of: :likes
  validates_uniqueness_of :outer_id, scope: [:user_id, :genre], message: 'already liked!'
  after_create :update_likes_count

  # GENRE = [['诗词', 1], ['歌曲', 4], ['美文', 2], ['杂谈', 3]]
  def outer_class
    if self.genre==1
      Poetry.find(self.outer_id)
    elsif self.genre==2
      Prose.find(self.outer_id)
    elsif self.genre==3
      Piece.find(self.outer_id)
    else
      Song.find(self.outer_id)
    end
  end

  def update_likes_count
    _class = outer_class
    return if _class.blank?
    _class.likes_count = _class.likes_count.to_i+1
    _class.save
  end
end