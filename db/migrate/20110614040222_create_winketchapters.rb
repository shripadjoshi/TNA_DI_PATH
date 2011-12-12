class CreateWinketchapters < ActiveRecord::Migration
  def self.up
    create_table :winketchapters do |t|
      t.integer :winketbook_id
			t.string :title
			t.timestamps
    end
  end

  def self.down
    drop_table :winketchapters
  end
end
