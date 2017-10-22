class ChangeIntegerLimitInrBranches < ActiveRecord::Migration[5.1]
  def change
  	change_column :branches, :landline, :integer, limit: 8
  	change_column :contacts, :mobile, :integer, limit: 8
  end
end
