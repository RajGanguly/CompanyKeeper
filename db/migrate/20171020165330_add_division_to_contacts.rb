class AddDivisionToContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :division, foreign_key: true
  end
end
