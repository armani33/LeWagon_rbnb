class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def index
    @flats = Flat.all
  end

  def search
    @flats = Flat.where("city = ? and guest_capacity >= ?", params[:city], params[:flat][:guest_capacity] )
    # format: @songs = Song.where({ title: params[:query] })
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      flash[:success] = "Flat added in your dashboard."
      redirect_to flat_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :postal_code, :city, :country, :guest_capacity, :price, :category, :description, :user_id)
  end
end
