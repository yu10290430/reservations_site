class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.order(updated_at: 'DESC')
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = current_user.reservations.new(params.require(:reservation).permit(:start_date, :end_date, :number_of_people,:room_id))
    if @reservation.save
      flash[:notice] = "予約新規登録しました"
      redirect_to :reservations
    else
      flash.now[:error] = "予約できませんでした。もう一度入力し直してください。"
      render "rooms/show" 
    end
    
   
  
  end

  def show
   
  end
  
  def edit
  end
end
