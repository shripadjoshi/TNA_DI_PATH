class CreateEStories < ActiveRecord::Migration
  def self.up
    create_table :e_stories do |t|
      t.string :content
      t.boolean :sys_favourite, :default => false
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :e_stories
  end
end
