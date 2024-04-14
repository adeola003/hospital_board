class User < ApplicationRecord
  enum role: { receptionist: 0, doctor: 1 }
end
