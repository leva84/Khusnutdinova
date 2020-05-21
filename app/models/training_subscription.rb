class TrainingSubscription < ApplicationRecord
  belongs_to :training
  belongs_to :user, optional: true

  validates :training, presence: true
  validates :user, uniqueness: { scope: :training_id }, if: -> { user.present? }
  validates :user_email, uniqueness: { scope: :training_id }, unless: -> { user.present? }
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  # Если есть юзер, выдаем его email,
  # если нет – дергаем исходный метод
  def user_email
    if user.present?
      user.email
    else
      super
    end
  end
end
