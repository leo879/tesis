class AddAcumuladoToMemberships < ActiveRecord::Migration
  def change
    add_column :memberships, :pago_acomulado, :float
  end
end
