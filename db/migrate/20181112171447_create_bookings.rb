class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :flat, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :accepted

      t.timestamps
    end
  end
end
