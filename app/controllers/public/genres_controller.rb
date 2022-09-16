class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @spots = @genre.spots.page(params[:page])

      # 観光地を評価順で表示
    if params[:latest]
     @spots = @genre.spots.latest.page(params[:page])
    elsif params[:old]
     @spots = @genre.spots.old.page(params[:page])
    elsif params[:star_count]
     @spots = @genre.spots.star_count.page(params[:page])
    else
     @spots = @genre.spots.page(params[:page])
    end
  end
end
