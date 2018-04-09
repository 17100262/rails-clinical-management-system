class AddUniqueIdentifierToClinicalCase < ActiveRecord::Migration[5.1]
  def change
    add_column :clinical_cases, :unique_identifier, :string,unique: true
  end
end
