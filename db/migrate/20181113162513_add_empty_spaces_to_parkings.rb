class AddEmptySpacesToParkings < ActiveRecord::Migration[5.2]
  def change
    add_column :parkings, :empty_spaces, :int
  end
end
