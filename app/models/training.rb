class Training < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :descriptions, dependent: :destroy
  has_many :training_subscriptions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { maximum: 10000 }

  mount_uploader :cover, CoverUploader
end
