class CreateWinketbooks < ActiveRecord::Migration
  def self.up
    create_table :winketbooks do |t|
      t.string :title
			t.text :description
      t.timestamps
    end
  end

  def self.down
    drop_table :winketbooks
  end
end
