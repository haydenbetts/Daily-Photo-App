class Day < ApplicationRecord
  belongs_to :growing_thing
  validates_uniqueness_of :post_date
  # This method associates the attribute ":avatar" with a file attachment
   has_attached_file :image, styles: {
     thumb: '100x100>',
     square: '200x200#',
     large: '500x500>'
   },
   :processors => [:jcropper]
   # these are virtual attributes. They do not exist in the db. They are teomporarily
   # passed into the object stored in memory in order to crop photo.

   # Validate the attached image is image/jpg, image/png, etc
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

   attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
   after_update :reprocess_image, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end


   def image_geometry(style = :original)
     @geometry ||= {}
     @geometry[style] ||= Paperclip::Geometry.from_file image.path(style)
   end

   private

   def reprocess_image
     image.reprocess!
   end

end
