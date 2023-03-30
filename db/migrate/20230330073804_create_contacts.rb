class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.integer :owner_id
      t.timestamps
    end
    add_foreign_key :contacts, :users, column: :owner_id
  end
end
