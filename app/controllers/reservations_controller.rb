class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = Reservation.all
  end
  
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    flash[:notice] = "ユーザーを削除しました"
    redirect_to :reservations
  end

  # def create
  #   @reservation = Reservation.new(reservation_params)
  #   if  current_user == @reservation.user
  #       flash[:alert] = "オーナーが予約することはできません。"
  #   elsif  @reservation.save
  #     redirect_to  :reservations, notice: "予約しました。"
  #   else
  #     render :new, alert: "予約されませんでした。"
  #   end
  # end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to  :reservations, notice: "予約しました。"
    else
      render :new, alert: "予約されませんでした。"
    end
  end

  private
      def reservation_params
        params.require(:reservation).permit(:start_date, :end_date, :people, :user_id, :room_id)
      end
end
