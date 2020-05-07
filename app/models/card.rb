class Card < ApplicationRecord
  has_many :playing_cards

  validates :name, presence: true, uniqueness: true
  #validates :photo, presence: true
  validates :deck_name, presence: true
end
