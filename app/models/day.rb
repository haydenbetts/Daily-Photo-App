class Day < ApplicationRecord
  attr_accessor :image, :crop_x, :crop_y, :crop_h, :crop_w
  belongs_to :growing_thing
  # validates_uniqueness_of :post_date
  # we actually only want to validate uniqueness for one user...
  mount_uploader :image, ImageUploader
  after_update :crop_image

  def crop_image
    image.recreate_versions! if crop_x.present?
  end


   private

end
