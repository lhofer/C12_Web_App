class RemoveYearFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :year, :integer
  end
end
