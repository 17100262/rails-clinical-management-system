# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:"admin@test.com",password:"admin123",role:"admin",approved: true, name: "Administrador")

50.times do
    User.create(email: Faker::Internet.unique.email,password:"admin123", name: Faker::Name.name,approved:true)
end

50.times do
	ClinicalCase.create!(user_id: User.all.pluck(:id).sample,
	unique_identifier: Faker::Number.unique.between(1, 100),
	date_of_birth: Faker::Date.between(50.years.ago, Date.today),
	date_of_diagnostic: Faker::Date.between(2.years.ago, Date.today),
	histology_type: ["Ductal","Lobular","Outro"].sample,
	histology_level: [1,2,3].sample,
	estrogen_receptors: ["Positivos","Negativos","Desconhecido"].sample,
	progesterone_receptors: ["Positivos","Negativos", "Desconhecido"].sample,
	her2: ["Positivo","Negativo"].sample,
	ki67: Faker::Number.between(1, 100),
	estadiamento_clinico: Faker::Lorem.paragraph,
	neoadjuvant_systemic_treatment: ["QT","HT","RT"].sample,
	surgery_date: Faker::Date.between(2.years.ago, Date.today),
	surgery_type: ["Tumorectomia","Mastectomia"].sample,
	sentinel_ganglion: ["Sim","Não"].sample,
	axillary_emptying: ["Sim","Não"].sample,
	adjuvant_chemotherapy: ["Sim","Não"].sample,
	adjuvant_radiotherapy: ["Sim","Não"].sample,
	adjuvant_hormone_therapy_duration: Faker::Number.between(1, 10),
	adjuvant_hormone_therapy_treatment: ["Tamoxifeno", "Inibidor da Aromatase","Goserelina"].sample,
	date_of_ipo_discharge: Faker::Date.between(2.years.ago, Date.today),
	first_follow_up_at_mgf: Faker::Date.between(2.years.ago, Date.today), 
	date_of_suspected_recurrence_local_recurrence: Faker::Date.between(2.years.ago, Date.today),
	date_of_suspected_recurrence_collateral_breast_cancer: Faker::Date.between(2.years.ago, Date.today),
	date_of_suspected_recurrence_distance_metastasis: Faker::Date.between(2.years.ago, Date.today),
	date_of_suspected_recurrence_second_neoplasm: Faker::Date.between(2.years.ago, Date.today),
	date_of_confirmation_of_recurrence: Faker::Date.between(2.years.ago, Date.today),
	global_survival: Faker::Lorem.paragraph,
	Specif_breast_cancer_survival: Faker::Lorem.paragraph,
	last_contact_or_death: Faker::Lorem.paragraph,
	death_cause: Faker::Lorem.paragraph,
	satisfaction_survey_record_discharge_text: Faker::Lorem.paragraph,
	satisfaction_survey_record_discharge: nil,
	satisfaction_survey_record_first_text: Faker::Lorem.paragraph,
	satisfaction_survey_record_first: nil,
	satisfaction_survey_record_next_text: Faker::Lorem.paragraph,
	satisfaction_survey_record_next: nil
	).imaging_controls.create!(
	    date_of_imaging: Faker::Date.between(6.months.ago, Date.today),
	    mammography: Faker::Boolean.boolean,
	    eco_breast: Faker::Boolean.boolean,
	    result: Faker::Lorem.paragraph
	)
end


# :date_of_imaging,:mammography,:eco_breast,:result

#:date_of_birth,:date_of_diagnostic,:histology_type,:histology_level,:estrogen_receptors,:progesterone_receptors,:her2,:ki67,:estadiamento_clinico,:neoadjuvant_systemic_treatment,:surgery_date,:surgery_type,:sentinel_ganglion, :axillary_emptying, :adjuvant_chemotherapy,:adjuvant_radiotherapy,:adjuvant_hormone_therapy_duration,:adjuvant_hormone_therapy_treatment, :date_of_ipo_discharge, :first_follow_up_at_mgf

#,:date_of_suspected_recurrence_local_recurrence, :date_of_suspected_recurrence_collateral_breast_cancer, :date_of_suspected_recurrence_distance_metastasis, :date_of_suspected_recurrence_second_neoplasm,:date_of_confirmation_of_recurrence, :global_survival, :Specif_breast_cancer_survival, :last_contact_or_death, :death_cause, :satisfaction_survey_record_discharge_text ,:satisfaction_survey_record_discharge,

#:satisfaction_survey_record_first_text, :satisfaction_survey_record_first, :satisfaction_survey_record_next_text, :satisfaction_survey_record_next