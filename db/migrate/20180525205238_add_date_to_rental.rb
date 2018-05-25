class AddDateToRental < ActiveRecord::Migration[5.1]
  def change
    add_column :rentals, :date, :string
  end
end
