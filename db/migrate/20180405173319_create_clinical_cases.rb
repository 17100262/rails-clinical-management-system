class CreateClinicalCases < ActiveRecord::Migration[5.1]
  def change
    create_table :clinical_cases do |t|
      t.references :user, foreign_key: true
      t.date :date_of_birth
      t.date :date_of_diagnostic
      t.string :histology_type
      t.integer :histology_level
      t.string :estrogen_receptors
      t.string :progesterone_receptors
      t.string :her2
      t.integer :ki67
      t.text :estadiamento_clinico
      t.string :neoadjuvant_systemic_treatment
      t.date :surgery_date
      t.string :surgery_type
      t.string :sentinel_ganglion
      t.string :axillary_emptying
      t.string :adjuvant_chemotherapy
      t.string :adjuvant_radiotherapy
      t.integer :adjuvant_hormone_therapy_duration
      t.string :adjuvant_hormone_therapy_treatment
      t.date :date_of_ipo_discharge
      t.date :first_follow_up_at_mgf
      
      t.date :date_of_suspected_recurrence_local_recurrence
      t.date :date_of_suspected_recurrence_collateral_breast_cancer
      t.date :date_of_suspected_recurrence_distance_metastasis
      t.date :date_of_suspected_recurrence_second_neoplasm
      
      t.date :date_of_confirmation_of_recurrence
      t.text :global_survival
      t.text :Specif_breast_cancer_survival
      t.text :last_contact_or_death
      t.text :death_cause
      
      t.text :satisfaction_survey_record_discharge_text
      t.attachment :satisfaction_survey_record_discharge
      
      t.text :satisfaction_survey_record_first_text
      t.attachment :satisfaction_survey_record_first
      
      t.text :satisfaction_survey_record_next_text
      t.attachment :satisfaction_survey_record_next
      
      

      t.timestamps
    end
  end
end
