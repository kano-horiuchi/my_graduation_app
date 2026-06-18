class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :skip_password_validation
  validates :password, length: { minimum: 3 }, if: -> { (new_record? || changes[:crypted_password]) && !skip_password_validation }
  validates :password, confirmation: true, if: -> { (new_record? || changes[:crypted_password]) && !skip_password_validation }
  validates :password_confirmation, presence: true, if: -> { (new_record? || changes[:crypted_password]) && !skip_password_validation }
  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, uniqueness: true
  has_many :boards, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_boards, through: :favorites, source: :board
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  enum :role, { general: 0, owner: 1 }

  def own?(object)
    object.user_id == id
  end

  def favorite(board)
    favorite_boards << board
  end

  def unfavorite(board)
    favorite_boards.destroy(board)
  end

  def favorite?(board)
    favorite_boards.include?(board)
  end

  def admin?
    owner?
  end
end
