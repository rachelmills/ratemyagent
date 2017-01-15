class ChangeColumnTypesToString < ActiveRecord::Migration[5.0]
  def up
    change_column :agents, :suburb, :string
    change_column :agents, :state, :string
  end

  def down
    change_column :agents, :suburb, :integer
    change_column :agents, :state, :integer
  end
end
