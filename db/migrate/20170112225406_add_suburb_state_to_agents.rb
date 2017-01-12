class AddSuburbStateToAgents < ActiveRecord::Migration[5.0]
  def up
    add_column :agents, :suburb_id, :integer
    add_column :agents, :state_id, :integer
  end

  def down
    drop_column :agents, :suburb_id
    drop_column :agents, :state_id
  end
end
