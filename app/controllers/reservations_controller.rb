class ReservationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @reservations = current_user.reservations.order(updated_at: 'DESC')
  end
  
  def confirm
    @reservation =current_user.reservations.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    render 'rooms/show' if @reservation.invalid?
    #binding.pry
  end
  
  def create
    @reservation = current_user.reservations.new(reservation_params)
      @room = Room.find(@reservation.room_id)
   render 'rooms/show' and return if params[:back] || !@reservation.save
   redirect_to @reservation
  end

  def show
   @reservation = Reservation.find(params[:id])
  end
  
  private
  
  def reservation_params
   params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :total_price, :total_day, :user_id, :room_id)
  end
end
