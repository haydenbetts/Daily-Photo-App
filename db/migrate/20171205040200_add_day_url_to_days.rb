class AddDayUrlToDays < ActiveRecord::Migration[5.1]
  def change
     change_table :days do |t|
      t.string :day_url
    end
  end
end
