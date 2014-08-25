class CreateCommissions < ActiveRecord::Migration
  def change
    create_table :commissions do |t|
      t.decimal :purchase_amount
      t.date :calculation_start_date
      t.date :calculation_end_date
      t.decimal :amount
      t.references :type, index: true
      t.boolean :payed

      t.timestamps
    end
  end
end
