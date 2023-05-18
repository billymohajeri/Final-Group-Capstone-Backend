class RoomsController < ApplicationController
  before_action :set_room, only: %i[show update destroy]

  def index
    @rooms = Room.all

    render json: @rooms
  end

  def show
    render json: @room
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :wifi, :tv, :room_service, :beds, :image_url, :reserved)
  end
end
