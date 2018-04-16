class CreateBrews < ActiveRecord::Migration[5.1]
  def change
    create_table :brews do |t|
      t.references :brewery, foreign_key: true
      t.string :name
      t.float :abv
      t.integer :ibus
      t.string :class

      t.timestamps
    end
  end
end
