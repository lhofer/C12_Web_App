class CreateDietCarbons < ActiveRecord::Migration
  def change
    create_table :diet_carbons do |t|
      t.string :diet
      t.float :carbon

      t.timestamps null: false
    end
  end
end
