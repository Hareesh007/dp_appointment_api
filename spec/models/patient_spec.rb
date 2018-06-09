require 'rails_helper'

RSpec.describe Patient, :type => :model do
        category = Patient.create(name: 'name',phone:'1244')
        subject{
                described_class.new(name: 'name',phone:'9394923334')
        }
  it "is valid with valid attributes" do
        expect(subject).to be_valid
  end

  it "is not valid without a Name" do
        subject.name = nil
        expect(subject).to_not be_valid
  end

  it "is not valid without a phone" do
        subject.phone = nil
        expect(subject).to_not be_valid
  end
end
