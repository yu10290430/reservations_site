class RoomsController < ApplicationController
 before_action :authenticate_user!, except: [:show, :search]
  def index
    @rooms = Room.where(user_id: current_user.id).where.not(room_image: nil).order(updated_at: 'DESC')
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
    @area = params[:area]
    @key = params[:key]
    if @area != nil 
     @rooms = Room.search(params[:area])
    elsif @key != nil 
     @rooms = Room.search(params[:key])
    else
     @rooms = Room.all
    end
  end
end
