class AdduserIdToBillings < ActiveRecord::Migration[6.1]
  def change
    add_reference :billings, :user, foreign_key: true
  end
end
