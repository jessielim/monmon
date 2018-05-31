class Removetablecards < ActiveRecord::Migration[5.1]
  def change
  	# remove_foreign_key :monsters , column: :card_id
  	remove_column :monsters, :card_id

  	drop_table :cards
  end
end
