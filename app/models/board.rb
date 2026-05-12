class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader
  belongs_to :user
  has_many :board_tags, dependent: :destroy
  has_many :tags, through: :board_tags

  validates :title, presence: true, length: { maximum: 255 }
  validates :tag_ids, presence: true
  validates :body, length: { maximum: 65535 }
  validates :board_image, presence: true
end
