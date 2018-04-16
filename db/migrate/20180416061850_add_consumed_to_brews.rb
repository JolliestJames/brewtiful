class AddConsumedToBrews < ActiveRecord::Migration[5.1]
  def change
    add_column :brews, :consumed, :boolean, default: false
  end
end
