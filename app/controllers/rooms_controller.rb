class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:title, :place, :content, :price, :image))
    @room.user_id = current_user.id
    if @room.save
      redirect_to :rooms
    else
      render "new"
    end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:title, :place, :content, :price, :image))
       flash[:notice] = "ユーザーIDが「#{@room.id}」の情報を更新しました"
       redirect_to :rooms
     else
       render "edit"
     end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "貸家を削除しました"
    redirect_to :rooms
  end

  def search
    @rooms = Room.search(params[:keyword])
    #@rooms = Room.search(params[:freeword])
  end

  private
    def room_params
      params.require(:room).permit(:title, :place, :content, :price, :image)
    end
end

