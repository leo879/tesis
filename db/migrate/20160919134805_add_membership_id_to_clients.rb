class AddMembershipIdToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :membership, index: true, foreign_key: true
  end
end
