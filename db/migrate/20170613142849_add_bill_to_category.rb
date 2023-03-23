class AddBillToCategory < ActiveRecord::Migration[5.0]
  def change
    add_reference :bills, :category, foreign_key: true
  end
end
