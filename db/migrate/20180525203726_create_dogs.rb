class CreateDogs < ActiveRecord::Migration[5.1]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :location

      t.timestamps
    end
  end
end
