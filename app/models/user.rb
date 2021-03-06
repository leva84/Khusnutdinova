class User < ApplicationRecord
  before_validation :set_name, on: :create

  has_many :games, dependent: :destroy
  has_many :training_subscriptions, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable

  validates :name, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  private

  def set_name
    self.name = "Товарисч №#{rand(777)}" if self.name.blank?
  end
end
