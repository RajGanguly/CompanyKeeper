class AddCompanyToDivisions < ActiveRecord::Migration[5.1]
  def change
    add_reference :divisions, :company, foreign_key: true
  end
end
