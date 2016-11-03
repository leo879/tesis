class CreateOutflows < ActiveRecord::Migration
  def change
    create_table :outflows do |t|
      t.date :feha
      t.string :concepto
      t.integer :nit
      t.string :entidad
      t.integer :numero_factura
      t.decimal :valor

      t.timestamps null: false
    end
  end
end
