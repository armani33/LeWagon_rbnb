class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :country
      t.integer :guest_capacity
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
