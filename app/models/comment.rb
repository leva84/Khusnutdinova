class Comment < ApplicationRecord
  belongs_to :training

  validates :commenter, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { maximum: 250 }
end
