class FixBrewColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :brews, :class, :classification
  end
end
