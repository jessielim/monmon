class Addcolumninmonsters < ActiveRecord::Migration[5.1]
  def change
  	add_reference :monsters, :user, index:true

  	add_foreign_key :monsters, :users
  end
end
