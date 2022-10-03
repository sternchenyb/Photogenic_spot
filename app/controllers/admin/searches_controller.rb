class Admin::SearchesController < ApplicationController
    before_action :authenticate_admin!

  def search
    @range = params[:range]
    @word = params[:word]
    @search = params[:search]
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @spots = Spot.looks(params[:search], params[:word])
    end
  end
end
