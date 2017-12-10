class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.datetime :post_date
      t.string :note
      t.belongs_to :growing_thing, index: true, foreign_key: true
      t.timestamps
    end
  end
end
