class Public::HomesController < ApplicationController
  def top
    @randoms = Spot.find(Spot.ids.sample(5))
    @genres = Genre.all
  end

  def about
    gon.spots = Spot.all
    @spots = Spot.all
  end
end
