class Micropost < ApplicationRecord
  belongs_to :user

  scope :order_by_desc, ->{order created_at: :desc}
  mount_uploader :picture, PictureUploader

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.post.content_length}
  validate :picture_size

  private

  def picture_size
    if picture.size > Settings.post.picture_size.megabytes
      errors.add :picture, t(".should_be_less")
    end
  end
end
