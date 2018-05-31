class Editcolumnmonsters < ActiveRecord::Migration[5.1]
  def change
  	remove_reference :monsters, :user, index:true

  	# remove_column :monsters, :user_id

  	add_reference :monsters, :deck, index:true

  	add_foreign_key :monsters, :decks
  end
end
