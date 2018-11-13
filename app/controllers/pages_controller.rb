class PagesController < ApplicationController
  layout "landing", only: [:home]

  def home
  end

  def about
  end

  def contact
  end
end
