class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :entries, :mpm, :miles_driven
  end
end
