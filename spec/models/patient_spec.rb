require 'rails_helper'

RSpec.describe Patient, type: :model do
  it 'is valid with valid attributes' do
    patient1 = Patient.new(
      name: 'Junna SALAOU',
      age: 42
    )

    expect(patient1).to be_valid
  end

  it 'is invalid without name' do
    patient1 = Patient.new(
      name: nil,
      age: 4
    )

    expect(patient1).to be_invalid
  end

  it 'is invalid with non integer age value' do
    patient1 = Patient.new(
      name: 'nil',
      age: 'hello'
    )

    expect(patient1).to be_invalid
  end
end
