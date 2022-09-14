class Public::HomesController < ApplicationController
  def top
    @randoms = Spot.order("RANDOM()").limit(5)
  end

  def about
    gon.spots = Spot.all
  end
end
