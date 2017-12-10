class AddImageToDays < ActiveRecord::Migration[5.1]
  def change
      add_attachment :days, :image
  end
end
