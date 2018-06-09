require 'rails_helper'
RSpec.describe Doctor, :type => :model do
        category = Doctor.create(name: 'name',phone:'1244',specialization:'general')
        subject{
                described_class.new(name: 'name',phone:'9394923334',specialization:'general')
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
  it "is not valid without a specialization" do
    subject.specialization = nil
    expect(subject).to_not be_valid
  end
end
