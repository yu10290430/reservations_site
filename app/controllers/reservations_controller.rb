class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations.order(updated_at: 'DESC')
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(params.permit(:start_date, :end_date,:number_of_people,:room_id, :user_id))
    if @reservation.save
      flash[:notice] = "予約新規登録しました"
      redirect_to :reservations
    else
      flash.now[:error] = "予約できませんでした。もう一度入力し直してください。"
      render template: "rooms/show"
    end
  end

  def show
    @room = Room.find_by(id: params[:id])
  end
  
  def edit
  end
end
