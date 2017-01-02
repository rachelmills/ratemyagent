class AgentsController < ApplicationController
  def new
    @agent = Agent.new
  end

  def create
    # render plain: params[:agent].inspect
    @agent = Agent.new(agent_params)
    @agent.save
    redirect_to agents_show(@agent)
  end

  private
  def agent_params
    params.require(:agent).permit(:name, :suburb)
  end
end