class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, foreign_key: "commented_id", dependent: :destroy
  has_many :commenters, through: :comments
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :picture, presence: true
  validates :content, length: { maximum: 140 }

  def like(user)
    self.likes.create(user_id: user.id)
  end

  def unlike(user)
    self.likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    self.users.include?(user)
  end

end
