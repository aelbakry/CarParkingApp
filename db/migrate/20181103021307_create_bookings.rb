class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :parking, index: true, foreign_key: true

      t.dateime :date

      t.timestamps
    end
  end
end
