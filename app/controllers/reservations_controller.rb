class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all.includes(:rooms)
  end

  def new
     @rooms = Room.all
    @reservation = Reservation.new
  end
  
  def create
  end

  def show
  end
  
  def edit
  end
end
