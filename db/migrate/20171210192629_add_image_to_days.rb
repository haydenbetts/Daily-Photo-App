class AddImageToDays < ActiveRecord::Migration[5.1]
  def change
    change_table :days do |t|
     t.string :image
    end
  end
end
