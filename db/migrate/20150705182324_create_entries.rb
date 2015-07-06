class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :num_people
      t.string :state
      t.float :electricity
      t.float :natural_gas
      t.float :heating_oil
      t.integer :year
      t.string :model
      t.float :mpg
      t.float :mpm
      t.string :diet_type
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
