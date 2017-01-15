class AddIndexToAgents < ActiveRecord::Migration[5.0]
  def change
    add_index :agents, [:name, :suburb]
  end
end
