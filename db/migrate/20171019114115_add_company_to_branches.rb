class AddCompanyToBranches < ActiveRecord::Migration[5.1]
  def change
    add_reference :branches, :company, foreign_key: true
  end
end
