class Foods < ActiveRecord::Migration[5.1]
  def change
  	create_table :foods do |t|
      t.string :name
      t.string :price
      t.string :photo

      t.timestamps
  end
  end
end
