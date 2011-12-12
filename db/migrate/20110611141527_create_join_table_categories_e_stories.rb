class CreateJoinTableCategoriesEStories < ActiveRecord::Migration
  def self.up
    create_table :categories_e_stories, :id => false do |t|
      t.integer :category_id
      t.integer :e_story_id
    end
  end

  def self.down
    drop_table :categories_e_stories
  end
end
