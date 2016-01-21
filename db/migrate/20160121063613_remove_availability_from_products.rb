class RemoveAvailabilityFromProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.remove :availability, :string
      t.integer :inventory
    end
  end
end
