class CreateWinkets < ActiveRecord::Migration
  def self.up
    create_table :winkets do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :winkets
  end
end
