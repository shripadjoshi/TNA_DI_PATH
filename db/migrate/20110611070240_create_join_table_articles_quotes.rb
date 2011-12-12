class CreateJoinTableArticlesQuotes < ActiveRecord::Migration
  def self.up
    create_table :articles_quotes, :id =>false do |t|
      t.integer :article_id
      t.integer :quote_id
    end
  end

  def self.down
    drop_table :articles_quotes
  end
end
