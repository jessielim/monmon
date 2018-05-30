class Edittables < ActiveRecord::Migration[5.1]
  def change

  	create_table :monsters do |t|
  		t.timestamps null:false
  		t.integer :spd
  		t.integer :spdef
  		t.integer :spatk
  		t.integer :def
  		t.integer :atk
  		t.integer :hp
  		t.string :move1
  		t.string :move2
  		t.belongs_to :card
   	end
  end
end
