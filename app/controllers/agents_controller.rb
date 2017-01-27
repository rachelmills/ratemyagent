class AgentsController < ApplicationController
  before_action :set_agent, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show, :find]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @params = false
    if !params[:by_name].blank?
      @params = true
      @agents = Agent.search_by_name(params[:by_name], params[:page])
      puts "#{@agents.first.name}"
    elsif params[:by_suburb]
      @params = true
      @agents = Agent.search_by_suburb(params[:by_suburb], params[:page])
    else
      @agents = Agent.paginate(page: params[:page], per_page: 5)
    end
  end

  def new
    @agent = Agent.new
  end

  def edit
  end

  def find
  end

  def create
    @agent = Agent.new(agent_params)
    @agent.user = current_user
    if @agent.save
      flash[:success] = 'Agent was successfully created'
      redirect_to agent_path(@agent)
    else
      render 'new'
    end
  end

  def update
    if @agent.update(agent_params)
      flash[:success] = 'Agent was successfully updated'
      redirect_to agent_path(@agent)
    else
      render 'edit'
    end
  end

  def show
    @ratings = Rating.where(agent_id: @agent.id)
  end

  def destroy
    @agent.destroy
    flash[:danger] = 'Agent was successfully deleted'
    redirect_to agents_path
  end

  private

  def set_agent
    @agent = Agent.find(params[:id])
  end

  def agent_params
    params.require(:agent).permit(:name, :suburb, :state)
  end

  def require_same_user
    if current_user != @agent.user && !current_user.admin?
      flash[:danger] = 'You can only edit or delete an agent you created'
      redirect_to root_path
    end
  end
end
