require 'rails_helper'

RSpec.describe Iban, type: :model do
  subject do
    described_class.new(name: 'albanian', iban_number: 'AL35202111090000000001234567')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with too short or too long name' do
    subject.name = 'g'
    expect(subject).to_not be_valid

    subject.name = 'Very long name for iban'
    expect(subject).to_not be_valid
  end

  context 'is not valid when name is not unique' do
    before { described_class.create!(name: 'albanian', iban_number: 'AL35202111090000000001234568') }
    it { expect(subject).to be_invalid }
  end

  it 'is not valid without a iban number' do
    subject.iban_number = nil
    expect(subject).to_not be_valid
  end

  context 'is not valid when iban number is not unique' do
    before { described_class.create!(name: 'foo', iban_number: 'AL35202111090000000001234567') }
    it { expect(subject).to be_invalid }
  end
end
