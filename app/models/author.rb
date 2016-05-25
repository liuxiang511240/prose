#作者
# coding: utf-8
class Author < ActiveRecord::Base
  include SoftDelete
  validates_presence_of :name, :message => 'name is must!'
  # validates_presence_of :birthday, :message => 'birthday is must!'
  # validates_presence_of :description, :message => 'description is must!'
  # validates_presence_of :dynasty, :message => 'dynasty is must!'
  validates_length_of :name, :maximum => 10, :message => 'Up to 10 characters'
  validates_length_of :dynasty, :maximum => 10, :message => 'Up to 10 characters'
  validates_length_of :birthday, :maximum => 20, :message => 'Up to 20 characters'
  validates_length_of :description, :maximum => 5000, :message => 'Up to 5000 characters'
  attr_accessible :name, :face, :dynasty, :birthday, :description, :deleted_at, :created_at, :updated_at

  before_save :update_author

  def can_edit?(user)
    !user.blank?
  end

  def can_delete?(user)
    return false if user.blank?
    user.is_admin?
  end

  private
  def update_author
    return unless name_changed?
    Piece.where(author_id: self.id).each { |t| t.update_attributes(:author => self.name) }
    Song.where(author_id: self.id).each { |t| t.update_attributes(:author => self.name) }
    Poetry.where(author_id: self.id).each { |t| t.update_attributes(:author => self.name) }
    Prose.where(author_id: self.id).each { |t| t.update_attributes(:author => self.name) }
  end
end
