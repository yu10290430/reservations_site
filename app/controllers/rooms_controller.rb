class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:room_id, :room_name, :memo, :price, :adress, :room_image))
      if @room.save
        redirect_to :rooms
      else
        render "new"
      end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  private
  
  def room_params
    params.require(:room).permit(:room_name, :memo, :price, :adress, :room_image )
  end
  
end
