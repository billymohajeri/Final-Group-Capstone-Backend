class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
end
