class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient
  validates_presence_of :doctor_id,:patient_id,:diseases
end
