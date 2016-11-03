class DropCourses < ActiveRecord::Migration
  def up
    drop_table :courses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
