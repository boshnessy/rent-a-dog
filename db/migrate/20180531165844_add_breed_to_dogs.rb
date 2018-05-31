class AddBreedToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :breed, :string
    add_column :dogs, :note, :text
  end
end
