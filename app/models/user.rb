class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: { receptionist: 0, doctor: 1 }
  # Validation for name and role presence
  validates :name, presence: true
  validates :role, presence: true

  # Validation for doctor's specialization
  validates :specialty, presence: true, if: -> { doctor? }
end
