class GeneralController < ApplicationController
  def index
    # getting all the appointments with doctor name and patient name and diseases
    @appointments =  Appointment.select('doctors.name as doc_name, patients.name as pat_name,appointments.diseases as  disease').joins(:doctor,:patient).order(created_at: :desc).paginate(page: params[:page], per_page: 2)
    msg = {:appointment => @appointments,meta: pagination_meta(@appointments)}
    render json: msg, status: status
  end

  #action for creating the doctor
  def create_doctor
   @doctor = Doctor.new(doctor_params)
     if @doctor.save
     msg = { :status => status, :message => "New Doctor Name Added.!", :doc_list => @doctor }
    render json: msg, status: status
     else
       render :json => { :errors => @doctor.errors }, :status => 422
     end
   end

   #get all doctors
   def get_doctor
     @doctor = Doctor.pluck(:id,:name)
     render json: @doctor
   end

   #action for creating the patient
   def create_patient
     @patient = Patient.new(patient_params)
     if @patient.save
       msg = {:status => status, :message => 'New Patient created.', :patient_list => @patient}
       render json: msg, status: status
     else
       render :json => { :errors => @patient.errors }, :status => 422
     end
   end

   #get all patient list to display in select atg
   def get_patient
    @patient = Patient.pluck(:id,:name)
    render json: @patient
   end

   #creating the new appointment with doctor
   def create_appointment
      @appointment = Appointment.new(appointment_params)
      if @appointment.save
        msg = {:status => status, :message => 'New Appointment created!.', :appointment_list => @appointment}
        render json: msg, status: status
      else
         render :json => { :errors => @appointment.errors}, :status => 422
      end
   end

   private
   def doctor_params
    params.permit(:name,:phone,:specialization)
   end
   def patient_params
    params.permit(:name,:phone)
   end
   def appointment_params
    params.permit(:doctor_id,:patient_id,:diseases)
   end
   def pagination_meta(object)
   {
     current_page: object.current_page,
     next_page: object.next_page,
     prev_page: object.previous_page,
     total_pages: object.total_pages,
     total_count: object.total_entries
   }
 end
end
