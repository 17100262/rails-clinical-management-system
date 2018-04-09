class ClinicalCase < ApplicationRecord
    has_attached_file :satisfaction_survey_record_discharge
    # validates_attachment_content_type :satisfaction_survey_record_discharge, content_type: /\Aimage\/.*\z/
    validates_attachment :satisfaction_survey_record_discharge, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
    
    has_attached_file :satisfaction_survey_record_first
    validates_attachment :satisfaction_survey_record_first, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
    # validates_attachment_content_type :satisfaction_survey_record_first
    # , content_type: /\Aimage\/.*\z/
    
    has_attached_file :satisfaction_survey_record_next
    validates_attachment :satisfaction_survey_record_next, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
    # validates_attachment_content_type :satisfaction_survey_record_next
    # , content_type: /\Aimage\/.*\z/
    
    has_many :imaging_controls,dependent: :destroy
    accepts_nested_attributes_for :imaging_controls, reject_if: :all_blank, allow_destroy: true
    
    belongs_to :user
    
    validates :date_of_birth, presence: true
    validates :unique_identifier, uniqueness: true
  
end
