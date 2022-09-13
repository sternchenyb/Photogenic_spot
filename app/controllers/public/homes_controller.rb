class Public::HomesController < ApplicationController
  def top
    gon.spots = Spot.all
  end

  def about
  end
end
