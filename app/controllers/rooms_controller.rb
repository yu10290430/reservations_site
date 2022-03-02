class RoomsController < ApplicationController
  def index
     @rooms = current_user.rooms.order(updated_at: 'DESC')
  end

  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(params.require(:room).permit(:room_id, :room_name, :memo, :price, :adress, :room_image, :user_id))
    @room.user = current_user
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
  
  def search
    @rooms = Room.all
  end
end
