class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validate :unique_room_date

  def unique_room_date
    return unless Reservation.where(room_id:, date:).exists?

    errors.add(:base, 'This room is already reserved for this date')
  end
end
