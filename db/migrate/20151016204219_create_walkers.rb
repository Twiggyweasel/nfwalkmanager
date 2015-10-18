class CreateWalkers < ActiveRecord::Migration
  def change
    create_table :walkers do |t|
      t.string :first_name, :last_name, :pledge_type
      t.decimal :amount_owed, :amount_paid, :amount_remaining
      t.boolean :walk_up, :default => false
      t.integer :team_id
      t.timestamps
    end
  end
end
