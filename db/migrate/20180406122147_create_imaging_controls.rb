class CreateImagingControls < ActiveRecord::Migration[5.1]
  def change
    create_table :imaging_controls do |t|
      t.references :clinical_case, foreign_key: true
      t.date :date_of_imaging
      t.boolean :mammography
      t.integer :birads
      t.boolean :eco_breast
      t.text :result

      t.timestamps
    end
  end
end
