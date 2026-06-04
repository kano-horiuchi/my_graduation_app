class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  has_many :boards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_boards, through: :favorites, source: :board
  enum :role, { general: 0, owner: 1 }

  def own?(object)
    object.user_id == id
  end

  def favorite?(board)
    favorite_boards.include?(board)
  end
end
