class AddBranchToContacts < ActiveRecord::Migration[5.1]
  def change
    add_reference :contacts, :branch, foreign_key: true
  end
end
