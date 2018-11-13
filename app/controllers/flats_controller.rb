class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def search
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
    params.require(:flat).permit(:start_date, :end_date, :flat_id)
  end
end
