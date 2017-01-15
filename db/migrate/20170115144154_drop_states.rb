class DropStates < ActiveRecord::Migration[5.0]
  def change
    drop_table :suburbs    # made a mistake migration.  This should have been states.  Corrected in next migration
  end
end
