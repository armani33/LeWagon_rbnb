class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    find_flat
  end

  def index
    @user = current_user
    @bookings = @user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    find_flat
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.save
      flash[:success] = "Booking request sent to owner for approval. :)"
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def destroy
    find_booking
    if @booking.accepted? == false || Time.now < @booking.start_date - 7.days
      @booking.destroy
      redirect_to user_bookings_path(params[:user_id], params[:id])
    else
      redirect_to root_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def set_current_user
    @user = current_user
  end
end
