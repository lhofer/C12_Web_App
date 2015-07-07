class AddFootprintToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :footprint, :float
  end
end
