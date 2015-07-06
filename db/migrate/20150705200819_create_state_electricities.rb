class CreateStateElectricities < ActiveRecord::Migration
  def change
    create_table :state_electricities do |t|
      t.string :state
      t.float :carbon

      t.timestamps null: false
    end
  end
end
