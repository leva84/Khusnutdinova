class Game < ApplicationRecord
  belongs_to :user
  belongs_to :alignment
  has_many :playing_cards, dependent: :destroy

  validates :user, presence: true
end
