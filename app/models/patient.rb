class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  validates_presence_of :name
  validates :phone,   :presence => {:message => 'Please enter the Phone number!'},
                    :numericality => true,
                    :length => { :minimum => 10, :maximum => 15 }

end
