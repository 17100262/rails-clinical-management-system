class ClinicalCasesController < ApplicationController
  before_action :set_clinical_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  authorize_resource

  # GET /clinical_cases
  # GET /clinical_cases.json
  def index
    @clinical_cases = ClinicalCase.all
    @clinical_cases = current_user.clinical_cases if params[:me]=="true"
  end
  

  # GET /clinical_cases/1
  # GET /clinical_cases/1.json
  def show
    respond_to do |format|
      format.html
      format.xls
    end
  end

  # GET /clinical_cases/new
  def new
    @clinical_case = current_user.clinical_cases.new
    @clinical_case.imaging_controls.build
  end

  # GET /clinical_cases/1/edit
  def edit
  end

  # POST /clinical_cases
  # POST /clinical_cases.json
  def create
    @clinical_case = current_user.clinical_cases.new(clinical_case_params)

    respond_to do |format|
      if @clinical_case.save
        format.html { redirect_to @clinical_case, notice: 'Caso clínico criado com sucesso.' }
        format.json { render :show, status: :created, location: @clinical_case }
      else
        format.html { render :new }
        format.json { render json: @clinical_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinical_cases/1
  # PATCH/PUT /clinical_cases/1.json
  def update
    
    respond_to do |format|
      if @clinical_case.update(clinical_case_params)
        @clinical_case.satisfaction_survey_record_discharge.destroy if clinical_case_params[:satisfaction_survey_record_discharge]==""
        @clinical_case.satisfaction_survey_record_first.destroy if clinical_case_params[:satisfaction_survey_record_first]==""
        @clinical_case.satisfaction_survey_record_next.destroy if clinical_case_params[:satisfaction_survey_record_next]==""
        
        format.html { redirect_to @clinical_case, notice: 'Caso clínico actualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @clinical_case }
      else
        format.html { render :edit }
        format.json { render json: @clinical_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinical_cases/1
  # DELETE /clinical_cases/1.json
  def destroy
    @clinical_case.destroy
    respond_to do |format|
      format.html { redirect_to clinical_cases_url, notice: 'Caso clínico destruído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinical_case
      @clinical_case = ClinicalCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinical_case_params
      params.require(:clinical_case).permit(:date_of_birth,:date_of_diagnostic,:histology_type,:histology_level,:estrogen_receptors,:progesterone_receptors,:her2,:ki67,:estadiamento_clinico,:neoadjuvant_systemic_treatment,:surgery_date,:surgery_type,:sentinel_ganglion, :axillary_emptying, :adjuvant_chemotherapy,:adjuvant_radiotherapy,:adjuvant_hormone_therapy_duration,:adjuvant_hormone_therapy_treatment, :date_of_ipo_discharge, :first_follow_up_at_mgf,:date_of_suspected_recurrence_local_recurrence, :date_of_suspected_recurrence_collateral_breast_cancer, :date_of_suspected_recurrence_distance_metastasis, :date_of_suspected_recurrence_second_neoplasm,:date_of_confirmation_of_recurrence, :global_survival, :Specif_breast_cancer_survival, :last_contact_or_death, :death_cause, 
        :satisfaction_survey_record_discharge_text ,
        :satisfaction_survey_record_discharge, 
        :satisfaction_survey_record_first_text, 
        :satisfaction_survey_record_first, 
        :satisfaction_survey_record_next_text, 
        :satisfaction_survey_record_next,
        :unique_identifier, 
        imaging_controls_attributes:[:date_of_imaging,:mammography,:eco_breast,:result,:_destroy,:id])
      
      
    end
end
