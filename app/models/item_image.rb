class ItemImage < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item, optional: true

  validates :src, presence: true
end