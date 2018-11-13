class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    find_flat
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
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id)
  end

  def find_flat
    @flat = Flat.find(params[:flat_id])
  end
end
