class AddCachedVotesToCoursesAndTeachers < ActiveRecord::Migration[6.0]
  def change
    change_table :courses do |t|
      t.integer :cached_votes_up, default: 0
    end

    change_table :teachers do |t|
      t.integer :cached_votes_up, default: 0
    end
  end
end
