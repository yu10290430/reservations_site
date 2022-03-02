class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.order(updated_at: 'DESC')
  end

  def new
    @room= Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation =Reservation.new(reservation_params)
    if @reservation.invalid?
    @room = Room.find(@reservation.room_id)
    render 'rooms/show'
    else
    redirect_to 'confirm'
    end
  end
  
  def create
    @reservation = current_user.reservations.new(reservation_params)
    @room = Room.find(@reservation.room_id)
    if @reservation.save
    flash[:notice] = "新規予約を登録しました"
    redirect_to 'show'
    end
  end

  def show
   @reservation = Reservation.find(params[:id])
  end
  
  def reservation_params
   params.require(:reservation).permit(:start_date, :end_date, :number_of_people, :room_id, :user_id)
  end
  
end
