class CreateContactsGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
