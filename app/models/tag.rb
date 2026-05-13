class Tag < ApplicationRecord
  has_many :board_tags, dependent: :destroy
  has_many :boards, through: :board_tags
  def self.ransackable_attributes(auth_object = nil)
    [ "name", "id", "created_at", "updated_at" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "board_tags", "boards" ]
  end
end
