class Comment < ApplicationRecord
  belongs_to :commenter, class_name: 'User'
  belongs_to :commented, class_name: 'Post'
  validates :commenter_id, presence: true
  validates :commented_id, presence: true
  validates :comment, presence: true, length: { maximum: 140 }
end
