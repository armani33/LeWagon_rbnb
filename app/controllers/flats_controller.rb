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
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
