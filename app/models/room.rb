class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  validates :name, uniqueness: true
end
