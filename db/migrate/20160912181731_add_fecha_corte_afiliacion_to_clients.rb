class AddFechaCorteAfiliacionToClients < ActiveRecord::Migration
  def change
    add_column :clients, :fecha_corte_afiliacion, :date
  end
end
