class Addcolumntomonsters < ActiveRecord::Migration[5.1]
  def change
  	add_column :monsters, :name, :string
  end
end
