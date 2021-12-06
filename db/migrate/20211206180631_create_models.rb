class CreateModels < ActiveRecord::Migration[6.1]
  def change
    create_table :models do |t|
      t.belongs_to :make, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
