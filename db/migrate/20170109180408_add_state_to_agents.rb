class AddStateToAgents < ActiveRecord::Migration[5.0]
  def change
    add_column :agents, :state, :string
  end
end
