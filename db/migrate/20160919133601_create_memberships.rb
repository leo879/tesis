class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.references :society, index: true, foreign_key: true
      t.string :periodicidad
      t.date :fecha_afiliacion
      t.date :fecha_vencimiento
      t.date :fecha_cuota

      t.timestamps null: false
    end
  end
end
