class Training < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :descriptions, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { maximum: 1000 }

  mount_uploader :cover, CoverUploader
end
