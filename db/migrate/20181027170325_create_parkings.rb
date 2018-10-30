class CreateParkings < ActiveRecord::Migration[5.2]
  def change
    create_table :parkings do |t|
      t.integer :parkingRef
      t.string :name
      t.string :location
      t.text :address
      t.string :postcode
      t.float :cost
      t.string :telephone
      t.text :notes

      t.timestamps
    end
  end
end
