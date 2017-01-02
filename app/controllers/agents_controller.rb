class AgentsController < ApplicationController
  def index
    @agents = Agent.all
    puts "number of agents is #{@agents.size}"
  end

  def new
    @agent = Agent.new
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      flash[:notice] = "Agent was successfully created"
      redirect_to agent_path(@agent)
    else
      render 'new'
    end
  end

  def update
    @agent = Agent.find(params[:id])
    if @agent.update(agent_params)
      flash[:notice] = 'Agent was successfully updated'
      redirect_to agent_path(@agent)
    else
      render 'edit'
    end
  end

  def show
    @agent = Agent.find(params[:id])
  end

  private
  def agent_params
    params.require(:agent).permit(:name, :suburb)
  end
end