class CreateSupervisorCommissions < ActiveRecord::Migration
  def change
    create_table :supervisor_commissions do |t|
      t.float :total
      t.date :start_date_comission
      t.date :end_date_comission
      t.float :comission
      t.boolean :paid
      t.references :supervisor, index: true
      t.string :supervisor

      t.timestamps
    end
  end
end
