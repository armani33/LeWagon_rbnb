class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  layout "landing", only: [:home, :about, :contact]

  def home
    if user_signed_in?
      redirect_to flats_path
    end
  end

  def about
  end

  def contact
  end
end
