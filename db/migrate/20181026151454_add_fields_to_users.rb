class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :surname, :string
    add_column :users, :date_of_birth, :date
  end
end
