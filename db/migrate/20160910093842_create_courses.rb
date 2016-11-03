class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :nombre
      t.text :descripcion
      t.float :valor_sesion
      t.float :valor_total
      t.references :id_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
