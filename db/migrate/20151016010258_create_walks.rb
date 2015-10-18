class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
      t.string :name, :location
      t.decimal :goal
      t.date :date
      t.timestamps
    end
  end
end
