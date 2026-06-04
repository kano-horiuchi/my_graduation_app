class Board < ApplicationRecord
  mount_uploader :board_image, BoardImageUploader
  belongs_to :user
  has_many :board_tags, dependent: :destroy
  has_many :tags, through: :board_tags
  has_many :favorite, dependent: :destroy

  validates :title, presence: true, length: { maximum: 255 }
  validates :tag_ids, presence: true
  validates :body, length: { maximum: 65535 }

  scope :with_all_tags, ->(tag_ids, auth_object = nil) {
    ids = Array(tag_ids).reject(&:blank?)
    return if tag_ids.blank?

    board_ids = joins(:tags)
                .where(tags: { id: ids })
                .group("boards.id")
                .having("COUNT(DISTINCT tags.id) = ?", ids.count)
                .pluck(:id)
    where(id: board_ids)
  }

  def self.ransackable_scopes(auth_object = nil)
    [ "with_all_tags" ]
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "title", "body", "created_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user" ]
  end
end
