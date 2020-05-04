class Game < ApplicationRecord
  belongs_to :user
  belongs_to :alignment
  has_many :playing_cards, dependent: :destroy

  delegate :title, :quantity, :deck_name, to: :alignment, allow_nil: true

  validates :user, presence: true

  def self.create_game_for_user!(user, alignment)
    # внутри единой транзакции
    transaction do
      game = create!(user: user, alignment: alignment)
      cards = Card.where(deck_name: game.deck_name)
      cards_play = cards.rand(game.quantity).uniq!

      cards_play.each do |card|
        PlayingCard.create!(card: card, game: game)
      end

      game
    end
  end
end
