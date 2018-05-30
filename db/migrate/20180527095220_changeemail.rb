class Changeemail < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :password, :string, null:false


  	add_column :users, :password, :string
  end
end
