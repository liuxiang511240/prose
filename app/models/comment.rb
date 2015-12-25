#评论
# coding: utf-8
class Comment
  include Mongoid::Document
  include Mongoid::BaseModel
  include Mongoid::SoftDelete
  include Mongoid::Timestamps
  include Mongoid::CounterCache
  field :content, type: String, default: ''
  field :outer_id, type: String
  field :genre, type: Integer
  field :user_id, type: String
  validates_presence_of :content, :message => 'content is must!'
  validates_length_of :content, :maximum => 5000, :message => 'Up to 5000 characters'

  attr_accessible :content, :outer_id, :genre, :user_id, :deleted_at, :created_at, :updated_at
  belongs_to :user
  after_create :update_comments_count
  after_destroy :reduce_comments_count


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

  def update_comments_count
    _class = outer_class
    return if _class.blank?
    _class.comments_count = _class.comments_count.to_i+1
    _class.save
  end

  def reduce_comments_count
    _class = outer_class
    return if _class.blank?
    _class.comments_count = _class.comments_count.to_i == 0 ? 0 : _class.comments_count.to_i-1
    _class.save
  end
end