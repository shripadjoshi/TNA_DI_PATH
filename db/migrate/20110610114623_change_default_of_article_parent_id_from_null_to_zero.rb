class ChangeDefaultOfArticleParentIdFromNullToZero < ActiveRecord::Migration
  def self.up
    change_column :articles, :article_parent_id, :integer, :default => 0
  end

  def self.down
    change_column :articles, :article_parent_id, :integer, :default => NULL
  end
end
