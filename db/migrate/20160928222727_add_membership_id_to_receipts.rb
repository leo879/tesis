class AddMembershipIdToReceipts < ActiveRecord::Migration
  def change
    add_reference :receipts, :membership, index: true, foreign_key: true
  end
end
