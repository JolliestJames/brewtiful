class BrewsPubs < ActiveRecord::Migration[5.1]
  def change
    create_table :brews_pubs, :id => false do |t|
      t.integer :brew_id
      t.integer :pub_id
    end 
  end
end
