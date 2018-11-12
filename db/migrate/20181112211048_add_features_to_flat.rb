class AddFeaturesToFlat < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :category, :string
    add_column :flats, :description, :text
    create_table :pictures do |t|
      t.string :picture
      t.references :flat
    end
  end
end
