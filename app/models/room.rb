class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image
  

  def self.search(search)
    if search !=""
      #params[:keyword].present?
      #search !=""
      @rooms = Room.where("place LIKE(?)" , "%#{search}%")
    else
      @rooms = Room.all
    end
  end
end