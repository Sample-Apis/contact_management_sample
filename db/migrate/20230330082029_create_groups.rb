class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :owner_id
      t.timestamps
    end
    add_foreign_key :groups, :users, column: :owner_id
  end
end
