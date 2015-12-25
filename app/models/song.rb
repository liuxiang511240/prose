#歌曲
class Song
  include Mongoid::Document
  include Mongoid::BaseModel
  include Mongoid::SoftDelete
  include Mongoid::Timestamps
  include Mongoid::CounterCache
  field :title, type: String, default: ''
  field :content, type: String, default: ''
  field :user_id, type: String
  field :updated_by, type: String
  field :author, type: String, default: ''
  field :author_id, type: String
  field :last_comment_id, type: Integer
  field :commented_at, type: DateTime
  field :comments_count, type: Integer, default: 0
  field :likes_count, type: Integer, default: 0
  # 回复过的人的 ids 列表
  field :comment_user_ids, type: Array, default: []
  # 最后回复人的用户名 - cache 字段用于减少列表也的查询
  field :last_commented_user_name
  # 删除人
  field :who_deleted
  # 精华 0 否， 1 是
  field :excellent, type: Integer, default: 0
  validates_presence_of :title, :message => 'title is must!'
  validates_presence_of :content, :message => 'content is must!'
  validates_presence_of :author, :message => 'author is must!'
  validates_length_of :title, :maximum => 50, :message => 'Up to 50 characters'
  validates_length_of :author, :maximum => 10, :message => 'Up to 10 characters'
  belongs_to :user
  belongs_to :author_class, :class_name => 'Author', :foreign_key => 'author_id'
  attr_accessible :title, :content, :author, :author_id, :user_id, :last_comment_id, :commented_at, :comments_count, :likes_count,
                  :comment_user_ids, :last_commented_user_name, :who_deleted, :excellent, :deleted_at, :updated_by

  before_save :update_author

  def can_edit?(user)
    return false if user.blank?
    self.user_id==user.id or user.is_admin?
  end

  def can_delete?(user)
    return false if user.blank?
    user.is_admin?
  end

  private
  def update_author
    return if self.author.blank?
    _author = Author.where(name: self.author).first
    _author = Author.create(:name => self.author) if _author.blank?
    self.author_id=_author.id
  end
end
