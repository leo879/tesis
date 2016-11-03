class AddEstadoToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :estado, :boolean
  end
end
