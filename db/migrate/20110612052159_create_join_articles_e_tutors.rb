class CreateJoinArticlesETutors < ActiveRecord::Migration
  def self.up
    create_table :articles_e_tutors, :id => false do |t|
      t.integer :article_id
      t.integer :e_tutor_id
    end
  end

  def self.down
    drop_table :articles_e_tutors
  end
end
