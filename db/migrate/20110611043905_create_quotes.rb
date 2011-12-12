class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.text :content
      t.string :speaker, :default => "Unknown"
      t.boolean :sys_favourite, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
