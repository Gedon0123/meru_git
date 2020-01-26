class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description
      t.string :image
      t.integer :buyer_id
      t.integer :saler_id, null: false
      t.integer :state, null: false
      t.integer :deposit, null: false
      t.integer :shipping, null: false

      t.timestamps
    end
  end
end
