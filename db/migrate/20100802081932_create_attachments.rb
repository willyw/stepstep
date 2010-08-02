class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :step_id
      t.string :caption
      
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
