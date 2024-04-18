class PatientsController < ApplicationController
  before_action :set_patient, only: %i[show edit update destroy]

  # GET /patients or /patients.json
  def index
    @patients = Patient.all
  end

  # GET /patients/1 or /patients/1.json
  def show; end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit; end

  # POST /patients or /patients.json
  def create
    @user = current_user
    @patient = Patient.new(patient_params)

    if @user.receptionist?
      respond_to do |format|
        if @patient.save
          format.html { redirect_to patient_url(@patient), notice: 'Patient was successfully created.' }
          format.json { render :show, status: :created, location: @patient }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to patients_path, notice: 'Only receptionist can perform this operation'
    end
  end

  # PATCH/PUT /patients/1 or /patients/1.json
  def update
    @user = current_user

    if @user.receptionist?
      respond_to do |format|
        if @patient.update(patient_params)
          format.html { redirect_to patient_url(@patient), notice: 'Patient was successfully updated.' }
          format.json { render :show, status: :ok, location: @patient }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @patient.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to patients_path, notice: 'Only receptionist can perform this operation'
    end
  end

  # DELETE /patients/1 or /patients/1.json
  def destroy
    @user = current_user
    if @user.receptionist?
      @patient.destroy
      respond_to do |format|
        format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to patients_url, alert: 'Only receptionists can perform this operation.'
    end
  end

def search_patients
  puts "Params: #{params.inspect}"
  if params[:name].present?
    @patients = Patient.where("name LIKE ?", "%#{params[:name]}%")
  else
    @patients = Patient.all
  end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_patient
    @patient = Patient.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def patient_params
    params.require(:patient).permit(:name, :age, :symptom)
  end
end
