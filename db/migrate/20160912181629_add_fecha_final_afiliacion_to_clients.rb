class AddFechaFinalAfiliacionToClients < ActiveRecord::Migration
  def change
    add_column :clients, :fecha_final_afiliacion, :date
  end
end
