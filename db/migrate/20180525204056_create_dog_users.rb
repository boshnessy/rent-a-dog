class CreateDogUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :dog_users do |t|
      t.integer :dog_id
      t.integer :user_id

      t.timestamps
    end
  end
end
