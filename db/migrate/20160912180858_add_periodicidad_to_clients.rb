class AddPeriodicidadToClients < ActiveRecord::Migration
  def change
    add_column :clients, :periodicidad, :string
  end
end
