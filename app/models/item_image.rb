class ItemImage < ApplicationRecord
  
  mount_uploader :image, ImageUploader
  belongs_to :item

# 枚数制限のメソッド
  # validates :check_number_of_item_images

  # def check_number_of_item_images
  #   if item && item.item_images.count > 10
  #   errors.add(:item, "枚数オーバー")
  #   end
  # end
end 
