class DropClientCourses < ActiveRecord::Migration
  def up
    drop_table :client_courses
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
