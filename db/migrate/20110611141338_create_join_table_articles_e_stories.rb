class CreateJoinTableArticlesEStories < ActiveRecord::Migration
  def self.up
    create_table :articles_e_stories, :id => false do |t|
      t.integer :article_id
      t.integer :e_story_id
    end
  end

  def self.down
    drop_table :articles_e_stories
  end
end
