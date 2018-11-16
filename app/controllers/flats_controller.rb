class FlatsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def index

    @flats = Flat.where.not(latitude: nil, longitude: nil)

    arrival_date = params[:start_date]
    leaving_date = params[:end_date]


    if params[:q].present?
      @flats = @flats.search_by_postalcode_city_and_country(params[:q])
    end

    if params[:guest].present?
      @flats = @flats.search_by_guest(params[:guest])
    end

    if params[:start_date].present? || params[:end_date].present?

      @flats = @flats.select do |flat|
        flat.availability?(arrival_date, leaving_date)
      end
    end

    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: { content: render_to_string(partial: "/flats/map_window", locals: { flat: flat }) }
      }
    end
  end

  def flats_user_index
    @user = current_user
    @flats = @user.flats
  end

  def owner_flat_bookings
    @user = current_user
    @flat = Flat.find(params[:flat_id])
  end

  # def search
  #   @flats = Flat.where("city = ? and guest_capacity >= ?", params[:city], params[:flat][:guest_capacity])
  #   # format: @songs = Song.where({ title: params[:query] })
  # end

  def show
    @flat = Flat.find(params[:id])
    @flats = []
    @flats << @flat
    @markers = @flats.map do |flat|
      {
        lng: flat.longitude,
        lat: flat.latitude,
        infoWindow: { content: render_to_string(partial: "/flats/map_window", locals: { flat: flat }) }
      }
    end
  end

  def new
    @flat = Flat.new
    @user = current_user
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      flash[:success] = "Flat added in your dashboard."
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flats_user_index_path
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_user_index_path
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :postal_code, :city, :country, :guest_capacity, :price, :category, :description, :user_id, :photo)
  end
end
