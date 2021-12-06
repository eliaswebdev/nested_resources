class CreateTrims < ActiveRecord::Migration[6.1]
  def change
    create_table :trims do |t|
      t.belongs_to :model, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
