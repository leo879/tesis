class AddFechaAfiliacionToClients < ActiveRecord::Migration
  def change
    add_column :clients, :fecha_afiliacion, :date
  end
end
