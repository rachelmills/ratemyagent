class DropSuburbs < ActiveRecord::Migration[5.0]
  def change
    drop_table :states    # made a mistake on previous migration.  This should have been suburbs
  end
end
