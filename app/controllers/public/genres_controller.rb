class Public::GenresController < ApplicationController
  def show
    @spots = Spot.page(params[:page])
    @genres = genre.all
  end
end
