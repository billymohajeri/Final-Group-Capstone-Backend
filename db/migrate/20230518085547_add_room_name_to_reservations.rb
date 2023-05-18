class AddRoomNameToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :room_name, :string
  end
end
