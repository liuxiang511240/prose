#歌曲
class Song < ActiveRecord::Base
  include SoftDelete
  validates_presence_of :title, :message => 'title is must!'
  validates_presence_of :content, :message => 'content is must!'
  validates_presence_of :author, :message => 'author is must!'
  validates_length_of :title, :maximum => 50, :message => 'Up to 50 characters'
  validates_length_of :author, :maximum => 10, :message => 'Up to 10 characters'
  belongs_to :user
  belongs_to :author_class, :class_name => 'Author', :foreign_key => 'author_id'
  has_many :comments, -> { where(genre: 4) }, foreign_key: :outer_id
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
