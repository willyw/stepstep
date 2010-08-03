class CreateDetails < ActiveRecord::Migration
  def self.up
    create_table :details do |t|
      t.integer :step_id
      t.string :caption
      
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :details
  end
end
