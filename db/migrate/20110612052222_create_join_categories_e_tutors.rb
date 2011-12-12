class CreateJoinCategoriesETutors < ActiveRecord::Migration
  def self.up
    create_table :categories_e_tutors, :id => false do |t|
      t.integer :category_id
      t.integer :e_tutor_id
    end
  end

  def self.down
    drop_table :categories_e_tutors
  end
end
