class Description < ApplicationRecord
  belongs_to :training

  mount_uploader :picture, PictureUploader
end
