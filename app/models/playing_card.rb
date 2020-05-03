class PlayingCard < ApplicationRecord
  belongs_to :game
  belongs_to :card

  delegate :name, :photo, :shirt, :deck_name, to: :card, allow_nil: true

  validates :game, :card, presence: true
end
