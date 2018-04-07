class AddUserIdToClinicalCases < ActiveRecord::Migration[5.1]
  def change
    add_reference :clinical_cases, :user, foreign_key: true
  end
end
