class Createusers < ActiveRecord::Migration[5.1]
  def change
  	create_table :users do |t|
  		t.timestamps null:false
  		t.string :first_name, null:false
  		t.string :last_name, null:false
  		t.string :email, null:false
  		t.string :password, null:false
  		t.string :password_digest
  		t.belongs_to :gamers
   	end

   	create_table :gamers do |t|
  		t.timestamps null:false
  		t.integer :level
  		t.integer :exp
  		
   	end

   	create_table :decks do |t|
  		t.timestamps null:false
  		t.string :name
  		t.belongs_to :user
   	end

   	create_table :cards do |t|
  		t.timestamps null:false
  		t.string :name
  		t.integer :level
  		t.belongs_to :deck
   	end

   	create_table :monmons do |t|
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
