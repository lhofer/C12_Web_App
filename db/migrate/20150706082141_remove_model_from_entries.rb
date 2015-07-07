class RemoveModelFromEntries < ActiveRecord::Migration
  def change
    remove_column :entries, :model, :string
  end
end
