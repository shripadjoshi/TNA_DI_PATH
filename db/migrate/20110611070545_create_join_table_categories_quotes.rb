class CreateJoinTableCategoriesQuotes < ActiveRecord::Migration
  def self.up
    create_table :categories_quotes, :id => false do |t|
      t.integer :category_id
      t.integer :quote_id
    end
  end

  def self.down
    drop_table :categories_quotes
  end
end
