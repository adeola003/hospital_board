require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user1 = User.new(
      name: 'Junn SALAOU',
      email: 'john@example.com',
      password: 'password',
      role: :receptionist
    )

    expect(user1).to be_valid
  end

  it 'is invalid with missing password' do
    user2 = User.new(
      name: 'korede',
      email: 'john@example.com',
      password: nil,
      role: :doctor
    )

    expect(user2).to be_invalid
  end

  it 'is invalid with missing name' do
    user3 = User.new(
      name: nil,
      email: 'john@example.com',
      password: nil,
      role: :doctor
    )

    expect(user3).to be_invalid
  end

  it 'is invalid with missing role' do
    user4 = User.new(
      name: 'nil',
      email: 'john@example.com',
      password: nil,
      role: nil
    )

    expect(user4).to be_invalid
  end
end
