class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.integer :mobile
      t.string :email
      t.string :designation

      t.timestamps
    end
  end
end
