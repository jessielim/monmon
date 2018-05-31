class Changecolumnnames < ActiveRecord::Migration[5.1]
  def change
  	remove_column :cards, :name, :string
  	remove_column :decks, :name, :string



  	add_column :cards, :card_name, :string
  	add_column :decks, :deck_name, :string
  end
end
