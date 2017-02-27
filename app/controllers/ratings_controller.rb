class RatingsController < ApplicationController
  before_action :set_rating, only: [:edit, :update, :show, :destroy]
  before_action :require_user, only: [:create]

  def home
  end

  def new
    @agent = Agent.find(params[:agent_id])
    if Rating.get_rating_for_agent_and_user(@agent, current_user)
      flash[:warning] = 'You have already rated this agent'
      redirect_to agent_path(@agent)
    else
      @rating = Rating.new
    end
  end

  def create
    # debugger
    @agent = Agent.find(params[:agent_id])
    if Rating.get_rating_for_agent_and_user(@agent, current_user)
      flash[:warning] = 'You have already rated this agent'
      redirect_to agent_path(@agent)
    else
      @rating = Rating.new(rating_params)
      @rating.user = current_user
      @agent.average_rating = Rating.get_average_rating_for_agent(@agent, @rating)
      @rating.agent = @agent
    end
    if @rating.save
      flash[:success] = 'Rating was successfully created'
      redirect_to rating_path(@rating)
    else
      render 'new'
    end
  end

  def index
    # debugger
    if params[:agent_id]
      @agent = Agent.find(params[:agent_id])
      @ratings = @agent.ratings.paginate(page: params[:page], per_page: 5)
    else
      @ratings = Rating.paginate(page: params[:page], per_page: 5)
    end
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
