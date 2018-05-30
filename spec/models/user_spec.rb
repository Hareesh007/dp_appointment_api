require 'rails_helper'
RSpec.describe User, :type => :model do
	user = User.create(name: 'username',email: 'email@gmail.com',password:'12345678')
	subject{
		described_class.new(name: 'BOD', email: 'test@gmail.com', password: '12345678')
	}
  it "is valid with valid attributes" do
  	expect(subject).to be_valid
  end

  it "is not valid without a name" do
  	subject.name = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a email" do
  	subject.email = nil
  	expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end
end
