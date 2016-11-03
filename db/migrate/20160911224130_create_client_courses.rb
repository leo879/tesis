class CreateClientCourses < ActiveRecord::Migration
  def change
    create_table :client_courses do |t|
      t.references :client, index: true, foreign_key: true
      t.references :course, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
