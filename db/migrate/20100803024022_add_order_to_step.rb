class AddOrderToStep < ActiveRecord::Migration
  def self.up
    add_column :steps, :order , :integer, :null => false
  end

  def self.down
  end
end
