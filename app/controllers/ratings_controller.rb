class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update, :show, :destroy]

  def home

  end

  def new
    @rating = Rating.new
  end

  def create
    debugger
    @rating = Rating.new(rating_params)
    @rating.user = User.first
    @rating.agent = Agent.first

    if @rating.save
      flash[:success] = "Rating was successfully created"
      redirect_to rating_path(@rating)
    else
      render 'new'
    end
  end


  def index
    @ratings = Rating.all
  end

  def edit

  end

  def update
    if @rating.update(rating_params)
      flash[:success] = 'Rating was successfully updated'
      redirect_to rating_path(@rating)
    else
      render 'edit'
    end
  end

  def show
    @rating = Rating.find(params[:id])

  end


  def destroy
    @rating.destroy
    flash[:danger] = 'Rating was successfully deleted'
    redirect_to ratings_path
  end

  private
  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:star_rating, :rating_text)
  end


end