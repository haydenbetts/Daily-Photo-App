class Day < ApplicationRecord
  attr_accessor :image
  belongs_to :growing_thing
  # validates_uniqueness_of :post_date
  # we actually only want to validate uniqueness for one user...
  mount_uploader :image, ImageUploader



   private

end
