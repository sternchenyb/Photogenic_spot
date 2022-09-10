class Public::GenresController < ApplicationController
  def show
    @spots = Spot.page(params[:page])
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
