require 'rails_helper'
RSpec.describe Appointment, :type => :model do
  it "belongs to a doctor" do
        relation = described_class.reflect_on_association(:doctor)
    expect(relation.macro).to eq :belongs_to
  end
  it "belongs to a patient" do
    relation = described_class.reflect_on_association(:patient)
    expect(relation.macro).to eq :belongs_to
  end
end
