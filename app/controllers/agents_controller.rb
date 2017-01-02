class AgentsController < ApplicationController
  def new
    @agent = Agent.new
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

  def show
    @agent = Agent.find(params[:id])
  end

  private
  def agent_params
    params.require(:agent).permit(:name, :suburb)
  end
end